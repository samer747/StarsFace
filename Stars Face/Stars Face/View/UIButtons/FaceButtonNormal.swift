//
//  FaceButtonNormal.swift
//  Stars Face
//
//  Created by samer on 10/2/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class FaceButtonNormal: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, background: UIColor,borderColor: CGColor,titleColor: UIColor , radius: CGFloat) {
        super.init(frame: .zero)
        
        backgroundColor = background
        layer.borderWidth = 1
        layer.borderColor = borderColor
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = radius
        translatesAutoresizingMaskIntoConstraints = false
        isEnabled = false
        alpha = 0.7
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
