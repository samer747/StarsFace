//
//  FaceChangeNameVC.swift
//  Stars Face
//
//  Created by samer on 10/6/20.
//  Copyright © 2020 samer. All rights reserved.

import UIKit
import Firebase

protocol changeNameDelegate {
    func nameChanged(newName: String)
}

class FaceChangeNameVC: UIViewController {
    
    var delegate : changeNameDelegate!
    
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
    
    let textField = FaceTextField(placeholder: "Enter Name ...")
    
    let titleLabel : UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textColor = FaceColors.neonBlue
        l.minimumScaleFactor          = 0.9
        l.lineBreakMode               = .byTruncatingTail
        l.text = "Enter Your New Name"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    let actionButton = FaceButtonNormal(title: "Done", background: .black, borderColor: FaceColors.neonBlue!.cgColor, titleColor: FaceColors.nicePink!, radius: 14)
    
    let cancleButton = FaceButtonClear(title: "Cancel", fontSize: 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.90)
        configueLayout()
        
        
        cancleButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        cancleButton.setTitleColor(.red, for: .normal)
        
        textField.layer.cornerRadius = 14
        
        actionButton.alpha = 1
        actionButton.isEnabled = true
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
    }
    
    fileprivate func configueLayout(){
        view.addSubview(containerView)
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(actionButton)
        view.addSubview(cancleButton)
        
        containerView.centerInSuperview(size: .init(width: view.frame.width - 40, height: 220))
        
        titleLabel.anchorBySize(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 28))
        
        actionButton.anchorBySize(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 44))
        
        //        textField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        //        textField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        textField.centerInSuperview(size: .init(width: view.frame.width - 80, height: 50))
        
        cancleButton.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 10, right: 20), size: .init(width: 0, height: 28))
        
    }
    
    @objc func dismissVC() {
        if textField.text == "" {
            textField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        guard let newName = textField.text else { return }
        guard let id = Auth.auth().currentUser?.uid else {return}
        
        let dataBaseRef = Database.database().reference().child("Users").child(id)
        
        let values = ["UserName": newName] as [String : Any]
        dataBaseRef.updateChildValues(values) { (err, ref) in
            if let err = err{
                print("UpdateChildError : ",err)
                return
            }
            self.delegate.nameChanged(newName: newName)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func cancelPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
