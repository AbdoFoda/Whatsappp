//
//  RegistrationResponse.swift
//  Regisreationform
//
//  Created by Abdo on 9/29/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation

enum RegistrationResponse :String {
    case emptyFields = "you missed to fill all the fields"
    case weakUserName = "the username must containt at least 4 characters"
    case weakPassword = "the password must containt at least 4 characters"
    case userExist = "this username is already exist"
    case passwordMismatch = "password mismatch"
    case success = "Success"
}
