//
//  ChatsViewController.swift
//  What'sApp
//
//  Created by Abdo on 10/27/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func chatsSwipe(_ sender: UISwipeGestureRecognizer) {
        HomeViewController.singleTone?.didSwipe(sender)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
