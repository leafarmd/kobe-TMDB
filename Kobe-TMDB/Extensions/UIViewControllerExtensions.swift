//
//  UIViewControllerExtensions.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
