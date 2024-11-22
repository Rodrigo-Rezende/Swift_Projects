//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Rodrigo Rezende on 17/05/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var rightAvatar: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var leftAvatar: UIImageView!
    @IBOutlet weak var Timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
