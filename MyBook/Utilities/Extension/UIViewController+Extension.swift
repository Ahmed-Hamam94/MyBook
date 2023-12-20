//
//  UIViewController+Extension.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import UIKit

extension UIViewController {
        func displayAlert(message: String, vc: UIViewController){
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            vc.present(alert, animated: true)
        }
}
