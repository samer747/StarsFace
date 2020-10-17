//
//  GetPointsOptions.swift
//  Stars Face
//
//  Created by samer on 10/7/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class GetPointsOptions: UIView {
    
    let imageV : UIImageView = {
       let iv = UIImageView()
        iv.tintColor = FaceColors.nicePink
        iv.contentMode = .scaleAspectFit
        
        
        return iv
    }()
    
    let textLable : UILabel = {
       let l = UILabel()
        l.font = FaceFonts.ArialRoundedMTBold
        l.heightAnchor.constraint(equalToConstant: 30).isActive = true
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.7
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.textColor = FaceColors.neonBlue
        return l
    }()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 20
        backgroundColor = #colorLiteral(red: 0.1031610295, green: 0.1031861082, blue: 0.1031575277, alpha: 1)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage,text: String) {
        self.init(frame: .zero)
        imageV.image = image.withRenderingMode(.alwaysOriginal).withTintColor(FaceColors.nicePink!)
        textLable.text = text
    }
    
    func configure(){
        let stackx = FaceStackView(arrangedSubviews: [imageV,textLable], spacing: 5, axis: .vertical, dis: .fill)
        addSubview(stackx)
        stackx.anchorBySize(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: .zero)
        

    }

}
