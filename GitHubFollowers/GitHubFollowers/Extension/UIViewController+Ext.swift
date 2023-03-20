//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 20/03/2023.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async { [weak self] in
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self?.present(alertVC, animated: true)
        }
    }
}
