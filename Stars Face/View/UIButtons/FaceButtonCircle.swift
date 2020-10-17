//
//  FaceButtonWide.swift
//  Stars Face
//
//  Created by samer on 9/30/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class FaceButtonCircle: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(background: UIColor,borderColor: CGColor,innerImageName: String,systintColor: UIColor , radius: CGFloat) {
        super.init(frame: .zero)
        backgroundColor = background
        layer.borderWidth = 2
        layer.borderColor = borderColor
        setImage(UIImage(systemName: innerImageName), for: .normal)
        tintColor = systintColor
        layer.cornerRadius = radius
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
