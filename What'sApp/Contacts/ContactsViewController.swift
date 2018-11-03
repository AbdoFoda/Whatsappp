//
//  ContactsViewController.swift
//  What'sApp
//
//  Created by Abdo on 10/27/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    var presenter : ContactPresenter!
    var contacts = [User] ()
    
    @IBOutlet weak var contactsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ContactPresenter(view:self)
        presenter.getContacts { (users) in
            // refresh local array
            contacts = users
            //reload table view
            contactsTableView.reloadData()
            
        }
    }

    
    @IBAction func contactsDidSwipe(_ sender: UISwipeGestureRecognizer) {
        HomeViewController.singleTone?.didSwipe(sender)
    }
    
   
}



extension ContactsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HomeViewController.singleTone?.gotoChat(with: contacts[indexPath.row])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        cell.nameLabel.text = contacts[indexPath.row].name
        cell.statusLabel.text = contacts[indexPath.row].status
        if let picture  = contacts[indexPath.row].profilePicture {
             cell.contactImageView.image = UIImage(data : picture)
        }else{
            cell.contactImageView.image = UIImage(named: "user-icon")
        }
        return cell
    }
    
    
}
