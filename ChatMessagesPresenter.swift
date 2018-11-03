//
//  ChatMessagesPresenter.swift
//  What'sApp
//
//  Created by Abdo on 11/3/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation
class ChatMessagesPresenter{
    var view : ChatMessagesViewController
    
    init(view : ChatMessagesViewController) {
        self.view = view
    }
    
    func getMessages(freind : User , completion : ([Message])->Void){
        UserRepository.getMessage(from: freind, completion: completion)
    }
    
    func sendMessage(to friend : User , text : String ) {
        UserRepository.sendMessage(to: friend, text: text)
    }
}
