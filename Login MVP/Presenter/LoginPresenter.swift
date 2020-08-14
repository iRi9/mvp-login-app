//
//  LoginPresenter.swift
//  Login MVP
//
//  Created by glb on 14/08/20.
//  Copyright © 2020 glb. All rights reserved.
//

import Foundation

protocol LoginViewDelegate: NSObjectProtocol {
    func showResponseLogin(response: LoginResponse)
}

class LoginPresenter {

    private let loginService: LoginService
    weak private var loginViewDelegate: LoginViewDelegate?

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func setViewDelegate(loginViewDelegate: LoginViewDelegate?) {
        self.loginViewDelegate = loginViewDelegate
    }

    func postUserData(user: User) {
        loginService.postLogin(user: user) { [weak self] response in
            self?.loginViewDelegate?.showResponseLogin(response: response)
        }
    }
}
