//
//  SignUpVC.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    let logoImageView = LogoImageView(frame: .zero,space: 40)
    
    let emailTextField = FaceTextField(placeholder: "Email")
    let nameTextField = FaceTextField(placeholder: "Name")
    let passwordTextField = FaceTextField(placeholder: "Password")
    
    let signupButton = FaceButtonNormal(title: "SignUp", background: .black, borderColor: FaceColors.neonBlue!.cgColor, titleColor: FaceColors.nicePink!, radius: 25)
    
    let alreadyHaveButton = FaceButtonClear(title: "Already Have Face", fontSize: 16)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Configue()
        textFieldsConfigue()
        layoutsConfigue()
    }
    
    
    @objc fileprivate func signupPressed(){
        guard let email = emailTextField.text else {return}
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            
            if let err = err {
                self.presentFaceAlertOnMainThread(title: "Ops", message: err.localizedDescription, buttonTitle: "OK")
                return
            }
            guard let uid = res?.user.uid else { return }
            let dataArray:[String: Any] = ["UserName": name,"rate": 0.0 ,"points": 0 ,"faceLink":"https://firebasestorage.googleapis.com/v0/b/starsface-a206e.appspot.com/o/PicsArt_10-05-11.10.18.jpg?alt=media&token=d121741f-6ffd-4ac6-aef0-78500a5f9192"]
            Database.database().reference().child("Users").child(uid).updateChildValues(dataArray)
            
            self.dismiss(animated: true, completion: nil)
            guard let mainTabBar = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
            mainTabBar.getUser()
        }
    }
    
    
    @objc fileprivate func alreadyHavePressed(){
        if(self.navigationController?.viewControllers.count ?? 0 > 2)
        {
            navigationController?.popViewController(animated: true)
            return
        }
        navigationController?.pushViewController(LoginVC(), animated: true)
    }
    
    
    fileprivate func Configue() {
        view.backgroundColor = .black
        signupButton.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
        alreadyHaveButton.addTarget(self, action: #selector(alreadyHavePressed), for: .touchUpInside)
    }
    
    
    fileprivate func textFieldsConfigue(){
        emailTextField.addTarget(self, action: #selector(enablingButtons), for: .editingChanged)
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(enablingButtons), for: .editingChanged)
    }
    
    
    @objc fileprivate func enablingButtons(){
        if emailTextField.text == "" || passwordTextField.text == "" || nameTextField.text == ""{
            signupButton.isEnabled = false
            signupButton.alpha = 0.7
        }else{
            signupButton.isEnabled = true
            signupButton.alpha = 1
        }
    }
    
    
    fileprivate func layoutsConfigue(){
        
        view.addSubview(logoImageView)
        logoImageView.anchorBySize(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 100, bottom: 0, right: 100), size: .init(width: 0, height: 80))
        
        let textfieldsStack = FaceStackView(arrangedSubviews: [emailTextField,nameTextField,passwordTextField,signupButton], spacing: 15, axis: .vertical, dis: .fillEqually)
        view.addSubview(textfieldsStack)
        textfieldsStack.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 25, bottom: 0, right: 25), size: .init(width: 0, height: 245))
        textfieldsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
        
        view.addSubview(alreadyHaveButton)
        alreadyHaveButton.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 0), size: .init(width: 0, height: 40))
    
    }
}
