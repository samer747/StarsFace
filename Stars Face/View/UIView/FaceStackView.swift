//
//  FaceStackView.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class FaceStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0,axis: NSLayoutConstraint.Axis,dis: UIStackView.Distribution) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.distribution = dis
        self.spacing = spacing
        self.axis = axis
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

