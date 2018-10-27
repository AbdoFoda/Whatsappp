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
        if let users = UserRepository.getAllUsers() {
            completion(users)
        }
    }
}
