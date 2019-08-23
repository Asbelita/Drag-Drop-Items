//
//  BaseAPIManager.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation
import Alamofire

typealias APIResponseHandler = (DataResponse<Any>) -> Void
typealias APIFailureHandler = (NSError) -> Void
typealias APICompletionHandler = (Any) -> Void
typealias Serialization = [String: Any]

@objc class BaseAPIManager : NSObject, APIServiceProtocol {
    
    
    enum APIMethod : String {
        case Get = "GET"
        case Post = "POST"
        case Put = "PUT"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    static let sharedInstance : BaseAPIManager = BaseAPIManager()
    
    fileprivate var reachabilityManager : NetworkReachabilityManager?
    
    override init() {
        super.init()
        configureReachabilityManager()
    }
    
    // MARK: - Reachability
    
    func isNetworkReachable() -> Bool {
        return reachabilityManager!.isReachable
    }
    
    fileprivate func configureReachabilityManager() {
        reachabilityManager = NetworkReachabilityManager(host: Configuration.getHost())
        reachabilityManager?.listener = { status in
            print(status)
            // We can use this closure to resend a request when the connection status change to reachable
        }
        reachabilityManager?.startListening()
    }
    
    // MARK: - Request Configuration

    fileprivate func getURLEncodedRequest(_ request : URLRequestConvertible, method : APIMethod) -> URLRequest {
        let encoding : ParameterEncoding = URLEncoding.default
        
        do {
            var encodedRequest =  try encoding.encode(request, with: nil)
            encodedRequest.httpMethod = method.rawValue
            return encodedRequest
        } catch  {
            
        }
        return URLRequest(url: URL(string: "")!)
    }
    // MARK: - Calling services
    
    func callURLService(_ service : String, method : APIMethod, parameters: [String : String]?, success :@escaping(_ result: [Any]) ->(), failure: @escaping (_ error: NSError) ->()){
        
        let successHandler : APIResponseHandler = { response in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch(response.result) {
            case .success(let JSON):
                // If the response has deserializable data
                if let responseData : Serialization = JSON as? Serialization {
                    success([responseData])
                }
                    // Send empty success when response is empty
                else {
                    success([])
                }
            case .failure(let error):
                if self.reachabilityManager!.isReachable {
                    failure(error as NSError)
                }
                else {
                    let userInfo : [String : Any] = [
                        // TODO: LOCALIZE THE STRINGS
                        NSLocalizedFailureReasonErrorKey : "Network Error",
                        NSLocalizedDescriptionKey: "No network connection"]
                    let error : NSError = NSError(domain: "PkUp Domain", code: 0, userInfo: userInfo)
                    failure(error)
                }
            }
        }
        
        let request : URLRequest
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        request = getRequestWithHeaders(service, queryParameters: parameters)
        let encodedRequest : URLRequest
        encodedRequest = getURLEncodedRequest(request, method: method)
        
        Alamofire.request(encodedRequest).validate().responseJSON(completionHandler: successHandler)
        
    }
    
    /**
     This method will configure the HTTP headers for the services that we call.
     */
    func getRequestWithHeaders(_ service : String, queryParameters: [String : String]?) -> URLRequest {
        let URLRequest : NSMutableURLRequest = NSMutableURLRequest()
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let URL : Foundation.URL = getURLComponents(service, queryParams: queryParameters!).url!
        
        URLRequest.url = URL
        
        return URLRequest as URLRequest
    }
    // MARK: - Private
    
    fileprivate func getURLComponents(_ service : String, queryParams: [ String : String]) -> URLComponents {
        var components : URLComponents = URLComponents()
        let baseURL : String = Configuration.getBaseURL()
        components.scheme = Configuration.getScheme()
        components.host = Configuration.getHost()
        components.path = "\(baseURL)/\(service)"
        components.queryItems = queryParams.map { URLQueryItem(name: $0, value:$1) }
        return components
    }
}
