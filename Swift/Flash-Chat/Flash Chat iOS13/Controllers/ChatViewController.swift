//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore() 
    
    var messages: [Message] = [] //[Message(sender: "1@2.com", body: "Hey"), Message(sender: "a@b.com", body: "Hello!"), Message(sender: "1@2.com", body: "Label test for big text many words many many many many many many many many many many many many many many many many many words")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        title = K.appName
        loadMessage()
    }
    
    func loadMessage() {
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            self.messages.removeAll()
            if let e = error {
                print(e)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String, let messageTime = data[K.FStore.dateField] as? Double {
                            let date = Date(timeIntervalSince1970: messageTime)
                            let dateFormatter = DateFormatter()
                            dateFormatter.timeStyle = DateFormatter.Style.short
                            dateFormatter.timeZone = .current
                            let localDate = dateFormatter.string(from: date)
                            let newMessage = Message(sender: messageSender, body: messageBody, timestamp: localDate)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                            
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody, K.FStore.dateField: Date().timeIntervalSince1970]) { (error) in
                if let e = error {
                    print(e)
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                    print("success saving data.")
                }
            }
        }
    }
    
    @IBAction func logOutPress(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let body = message.body
        let time = message.timestamp
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = body
        cell.Timestamp.text = time
        if message.sender == Auth.auth().currentUser?.email {
            cell.rightAvatar.isHidden = false
            cell.leftAvatar.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
            cell.Timestamp.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.rightAvatar.isHidden = true
            cell.leftAvatar.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
            cell.Timestamp.textColor = UIColor(named: K.BrandColors.lightPurple)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
