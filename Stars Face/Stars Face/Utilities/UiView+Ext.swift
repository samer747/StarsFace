//
//  UiView+Ext.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit


extension UIView {
    
    func addBackground(Bimage: UIImage) {
        
        let backGroundImageView = BackGroundImageView(Bimage: Bimage)
        
        addSubview(backGroundImageView)
        backGroundImageView.fillSuperview()
    }
}
