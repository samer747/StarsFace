//
//  gradiantImageView.swift
//  Stars Face
//
//  Created by samer on 10/3/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class gradiantImageView: UIImageView {
    
    let blackup : UIImageView = {
       let i = UIImageView()
        i.image = FaceImages.blackGradiantUP
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    let blackDown : UIImageView = {
       let i = UIImageView()
        i.image = FaceImages.blackGradiantDown
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(innerImage: UIImage, upHeight: CGFloat,upAlpha: CGFloat,downHeight: CGFloat,downAlpha: CGFloat) {
        super.init(frame: .zero)
        
        image = innerImage
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
        
        blackup.alpha = upAlpha
        blackDown.alpha = downAlpha
        
        addSubview(blackup)
        addSubview(blackDown)
        
        blackup.anchorBySize(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: upHeight))
        blackDown.anchorBySize(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: downHeight))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
