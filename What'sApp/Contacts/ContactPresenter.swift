//
//  ContactPresenter.swift
//  What'sApp
//
//  Created by Abdo on 10/27/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation
class ContactPresenter {
    weak var view : ContactsViewController?
    init(view : ContactsViewController) {
        self.view = view
    }
    
    func getContacts(completion:([User])->Void ) {
        if var users = UserRepository.getAllUsers() {
            users.sort { (user1, user2) -> Bool in
                return user1.name! < user2.name!
            }
            completion(users)
        }
    }
}
