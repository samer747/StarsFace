//
//  FaceAlertVC.swift
//  Stars Face
//
//  Created by samer on 10/2/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class FaceAlertVC: UIViewController {
    
        let padding: CGFloat = 20
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor       = .black
        v.layer.cornerRadius    = 16
        v.layer.borderWidth     = 2
        v.layer.borderColor     = FaceColors.nicePink?.cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let titleLabel : UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textColor = FaceColors.neonBlue
        l.minimumScaleFactor          = 0.9
        l.lineBreakMode               = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let messageLable : UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 14)
        l.textColor = .white
        l.minimumScaleFactor          = 0.75
        l.numberOfLines = 3
        l.lineBreakMode               = .byWordWrapping
        l.adjustsFontForContentSizeCategory   = true
        l.adjustsFontSizeToFitWidth           = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let actionButton = FaceButtonNormal(title: "Ok", background: .black, borderColor: FaceColors.neonBlue!.cgColor, titleColor: FaceColors.nicePink!, radius: 16)
    
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text     = title
        self.messageLable.text   = message
        self.actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configueLayout()
        actionButton.alpha = 1
        actionButton.isEnabled = true
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
    }
    
    fileprivate func configueLayout(){
        view.addSubview(containerView)
        view.addSubview(titleLabel)
        view.addSubview(messageLable)
        view.addSubview(actionButton)
        
        containerView.centerInSuperview(size: .init(width: 280, height: 220))
        
        titleLabel.anchorBySize(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 28))
        
        actionButton.anchorBySize(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 44))
        
        messageLable.anchorBySize(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: actionButton.topAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 8, left: padding, bottom: 12, right: padding), size: .zero)
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
