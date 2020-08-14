//
//  LoginService.swift
//  Login MVP
//
//  Created by glb on 14/08/20.
//  Copyright © 2020 glb. All rights reserved.
//

import Foundation

class LoginService {
    func postLogin(user: User, completion: @escaping (LoginResponse) -> Void) {
        //Mark: for test purpose only
        guard user.email == "giri@me.com", user.password == "secret" else {
            completion(LoginResponse(message: "The email and password you entered did not match our records. Please try again.", status: false))
            return
        }

        completion(LoginResponse(message: "Success", status: true))
    }
}
