//
//  UserRepository.swift
//  Regisreationform
//
//  Created by Abdo on 9/29/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation
import CoreData

class UserRepository  {
  
    static var loggedInUser : User?
    
    static func login(user : User){
        loggedInUser = user
    }
    
    static func logout() {
        loggedInUser = nil
    }
    static func getAllUsers() ->[User]? {
        let request : NSFetchRequest = User.fetchRequest()
        do{
            let result = try AppDelegate.viewContext.fetch(request)
            return result
        }catch{
            print(error)
        }
        return nil
    }
    
    static func userNameExist (userName :String) -> Bool {
        let request :NSFetchRequest = User.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", userName)
        do {
            let result = try AppDelegate.viewContext.fetch(request)
            return result.count > 0
        }catch {
            print(error)
            return false
        }
    }
    
    static func canLogin (username : String , password :String)-> User? {
        let request :NSFetchRequest = User.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@ AND password = %@", username , password)
        do {
            let result = try AppDelegate.viewContext.fetch(request)
            if(result.count > 0) {
                return result[0]
            }
        }catch {
            print(error)
        
        }
        return nil
    }
    
    static func insertUser(_ username : String ,_ password : String) ->Bool {
        if !UserRepository.userNameExist(userName: username) {
            let user = User(context: AppDelegate.viewContext)
            user.name = username
            user.password = password
           // user.profilePicture = Data(UIImage)
            return true
        }else{
            return false
        }
    }
    
}
