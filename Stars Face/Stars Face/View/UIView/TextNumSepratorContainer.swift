//
//  TextNumSepratorContainer.swift
//  Stars Face
//
//  Created by samer on 10/3/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class TextNumSepratorContainerView: UIView {
    let numberLable : UILabel = {
       let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 30)
        l.textColor = FaceColors.neonBlue
        l.heightAnchor.constraint(lessThanOrEqualToConstant: 27).isActive = true
        l.textAlignment = .center
        
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let textLable : UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 17)
        l.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.textColor = FaceColors.nicePink
        return l
    }()
    
    let seprator : UIView = {
       let v = UIView()
        v.backgroundColor = .darkGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(number: String,text: String) {
        self.init(frame: .zero)
        numberLable.text = number
        textLable.text = text
    }
    
    func configure(){
        let stackx = FaceStackView(arrangedSubviews: [numberLable,textLable], spacing: 0, axis: .vertical, dis: .fill)
        addSubview(stackx)
        stackx.anchorBySize(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: -5, left: 0, bottom: 5, right: 0), size: .zero)
        
        addSubview(seprator)
        seprator.anchorBySize(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: -2, bottom: 0, right: 0), size: .init(width: 1, height: 0))
    }
}

