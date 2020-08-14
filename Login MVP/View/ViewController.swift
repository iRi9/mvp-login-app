//
//  ViewController.swift
//  Login MVP
//
//  Created by glb on 14/08/20.
//  Copyright © 2020 glb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewDelegate {

    private let loginPresenter = LoginPresenter(loginService: LoginService())

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.tintColor = .lightGray
            emailTextField.setIcon(UIImage(systemName: "envelope")!)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.tintColor = .lightGray
            passwordTextField.setIcon(UIImage(systemName: "lock")!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter.setViewDelegate(loginViewDelegate: self)
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }

        let user = User(email: email, password: password)
        loginPresenter.postUserData(user: user)
    }

    func showResponseLogin(response: LoginResponse) {
        Alert.present(title: nil, message: response.message, action: .close, from: self)
    }
    
}

