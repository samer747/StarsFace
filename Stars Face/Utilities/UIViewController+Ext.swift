//
//  UIViewController+Ext.swift
//  Stars Face
//
//  Created by samer on 10/2/20.
//  Copyright © 2020 samer. All rights reserved.
//
import UIKit

extension UIViewController {
    
    
    // Present Alert view in any UiViewController
    func presentFaceAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = FaceAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
