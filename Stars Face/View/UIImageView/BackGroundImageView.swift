//
//  BackGroundImageView.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class BackGroundImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    init(Bimage: UIImage) {
        super.init(frame: CGRect())
        image = Bimage
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
