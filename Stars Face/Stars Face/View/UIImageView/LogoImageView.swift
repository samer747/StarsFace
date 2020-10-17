//
//  LogoImageView.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class LogoImageView: UIView {
    
    let upperImageV : UIImageView = {
      let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = FaceImages.uperLogo
        i.contentMode = .scaleAspectFit
        i.layer.shadowColor = FaceColors.nicePink?.cgColor
        i.layer.shadowRadius = 20
        i.layer.shadowOpacity = 1
        return i
    }()
    
    let bottomImageV : UIImageView = {
      let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.image = FaceImages.bottomLogo
        i.contentMode = .scaleAspectFit
        i.layer.shadowColor = FaceColors.lightBlue?.cgColor
        i.layer.shadowRadius = 20
        i.layer.shadowOpacity = 1
        return i
    }()
    
    init(frame: CGRect , space: CGFloat) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(upperImageV)
        addSubview(bottomImageV)

        upperImageV.anchorBySize(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: (frame.height / 2)))
        
        bottomImageV.anchorBySize(top: upperImageV.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: -space, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: upperImageV.frame.height))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
