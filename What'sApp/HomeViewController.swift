//
//  ViewController.swift
//  What'sApp
//
//  Created by Abdo on 10/9/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var chatsContainerLeadingConstraint: NSLayoutConstraint!
    static var singleTone : HomeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewController.singleTone = self
    }
    var gotoFriend : User!
    func gotoChat(with friend : User){
        gotoFriend = friend
        performSegue(withIdentifier: "chatSegue", sender: self)
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = mainStoryBoard.instantiateViewController(withIdentifier: "loginScreen")
        self.present(loginVC,animated:  true)
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    func didSwipe(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right){
            chatsContainerLeadingConstraint.constant += view.frame.width
        }else if(sender.direction == .left){
            chatsContainerLeadingConstraint.constant -= view.frame.width
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chatVC = segue.destination as? ChatMessagesViewController{
            chatVC.friend = gotoFriend
        }
    }
    
}

