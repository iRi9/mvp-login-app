//
//  Alert.swift
//  Login MVP
//
//  Created by glb on 14/08/20.
//  Copyright © 2020 glb. All rights reserved.
//

import UIKit

struct Alert {
    static func present(title: String?, message: String, action: Alert.Action..., from controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)

        controller.present(alertController, animated: true)
    }
}

extension Alert {
    enum Action {
        case ok(handler: (() -> Void)? )
        case close

        private var title: String {
            switch self {
            case .ok:
                return "Ok"
            case .close:
                return "Close"
            }
        }

        private var handler: (() -> Void)? {
            switch self {
            case .ok(let handler):
                return handler
            case .close:
                return nil
            }
        }

        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }
}
