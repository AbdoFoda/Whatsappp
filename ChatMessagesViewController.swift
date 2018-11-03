//
//  ChatMessagesViewController.swift
//  What'sApp
//
//  Created by Abdo on 11/3/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class ChatMessagesViewController: UIViewController {
    
    // MARK:- Variables
    var presenter : ChatMessagesPresenter!
    var messages = [Message]()
    var friend : User!
    // MARK:- Outlets
    @IBOutlet weak var messagesCollectionView: UICollectionView!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    
    // MARK:- IBActions
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        presenter.sendMessage(to : friend , text : messageTextField.text!)
        refreshMessages()
    }
    
    func refreshMessages() {
        presenter.getMessages(freind: friend) { (messages) in
            self.messages = messages
            self.messagesCollectionView.reloadData()
        }
    }
    
    // MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ChatMessagesPresenter(view :self)
        refreshMessages()
        // Do any additional setup after loading the view.
    }
    

    
}

extension ChatMessagesViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = messagesCollectionView.dequeueReusableCell(withReuseIdentifier: "messageCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].text
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "HH:mm"
        let myString = formatter.string(from: messages[indexPath.row].time!)
        cell.timeLabel.text = myString
        return cell
    }
    
    
}
