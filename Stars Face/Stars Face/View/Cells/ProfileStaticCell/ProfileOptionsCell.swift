//
//  StaticsCell.swift
//  Stars Face
//
//  Created by samer on 10/4/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class ProfileOptionsCell: UICollectionViewCell {
    
    static let reuseID = "White"
    
    let optionImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.tintColor = FaceColors.nicePink
        return iv
    }()
    let textLable : UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 18)
        l.textColor = .white
        l.textAlignment = .left
        return l
    }()
    let arrowImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.tintColor = FaceColors.neonBlue
        iv.image = UIImage(systemName: "arrowtriangle.right")
        return iv
    }()
    let seprator : UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2728151381, green: 0.2728670537, blue: 0.2728078365, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configue()
        configueLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configue(){
        
    }
    func configueLayout(){
        addSubview(optionImageView)
        optionImageView.anchorBySize(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: 30, height: 30))
        optionImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(arrowImageView)
        arrowImageView.anchorBySize(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 20, right: 18), size: .init(width: 20, height: 0))
        arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        addSubview(textLable)
        textLable.anchorBySize(top: nil, leading: optionImageView.trailingAnchor, bottom: bottomAnchor, trailing: arrowImageView.leadingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .zero)
        textLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(seprator)
        seprator.anchorBySize(top: nil, leading: textLable.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: -1, bottom: 0, right: 0), size: .init(width: 0, height: 1))
        
    }
}
