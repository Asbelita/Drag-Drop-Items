//
//  ChatTableViewCell.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/15/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePicture: DesignableImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var newMessagesAmount: UILabel!
    @IBOutlet weak var hasNewMessages: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setStyles()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            self.backgroundColor = Color.secundary
            self.name.textColor = Color.white
            self.lastMessage.textColor = Color.white
            self.date.textColor = Color.white
        }else{
            self.backgroundColor = Color.white
            self.name.textColor = Color.black
            self.lastMessage.textColor = Color.lightGray
            self.date.textColor = Color.lightGray
        }
    }
    
    func setStyles(){
        name.style(style: TextStyle.subtitleBold)
        lastMessage.style(style: TextStyle.chatListBody)
        date.style(style: TextStyle.chatListBody)
        newMessagesAmount.style(style: TextStyle.chatListBadge)
    }

}
