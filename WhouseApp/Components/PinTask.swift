

import UIKit

class PinTask: NSObject {
    var id : Int?
    var task : String?
    var x : Int = 0
    var y : Int = 0
    
    init(id: Int, task: String) {
        self.id = id
        self.task = task
    }
}
