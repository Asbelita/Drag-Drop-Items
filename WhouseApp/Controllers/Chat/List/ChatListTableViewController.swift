//
//  ChatListTableViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/15/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit
import MessageKit

class ChatListTableViewController: UITableViewController {

    var conversations = [Conversation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLogoToNavbar()
        self.setData()
    }
    
    private func setData(){
        let date = Date()
        let list = ["John Doe", "Morgan Freeman", "John Stewart", "Bill Barfield","Timothy Richardson","Davin Johansen","Mike Goodman","Michael Iacoletti","Richard McCain","Robert Stevenson","Jonathan Macklemore", "John Doe", "Morgan Freeman", "John Stewart", "Bill Barfield","Timothy Richardson","Davin Johansen","Mike Goodman","Michael Iacoletti","Richard McCain","Robert Stevenson","Jonathan Macklemore"]
        for (index, element) in list.enumerated() {
            let sender = ChatUser(senderId: String(index), displayName: element)
            let newMessages = Int.random(in: 0...20)
            let conversation = Conversation(
                sender: sender,
                profilePicture: UIImage(named: "profilePic")!,
                lastMessage: "Hello there!, listen to my offer",
                date: Calendar.current.date(byAdding: .day, value: -index, to: date)!,
                newMessagesAmount: String(newMessages),
                hasNewMessages: newMessages > 0
            )
            conversations += [conversation]
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.conversations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatListCell", for: indexPath) as! ChatTableViewCell
        
        cell.profilePicture.image = conversations[indexPath.row].profilePicture
        cell.name.text = conversations[indexPath.row].sender.displayName
        cell.lastMessage.text = conversations[indexPath.row].lastMessage
        cell.date.text = MessageKitDateFormatter.shared.string(from: conversations[indexPath.row].date)
        
        
        cell.newMessagesAmount.text = conversations[indexPath.row].newMessagesAmount
        cell.hasNewMessages.isHidden = !conversations[indexPath.row].hasNewMessages
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conversation = conversations[indexPath.row]
        let vc = ChatViewController(conversation: conversation)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
