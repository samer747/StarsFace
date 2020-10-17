//
//  FaceButtonClear.swift
//  Stars Face
//
//  Created by samer on 9/30/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class FaceButtonClear: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String , fontSize: CGFloat ) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        setTitleColor(FaceColors.lightBlue, for: .normal)
        titleLabel?.font = .systemFont(ofSize: fontSize)
        layer.shadowColor = FaceColors.neonBlue?.cgColor
        layer.shadowRadius = 30
        layer.shadowOpacity = 1
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
