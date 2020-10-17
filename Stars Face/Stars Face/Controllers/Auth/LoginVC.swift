//
//  LoginVC.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    let logoImageView = LogoImageView(frame: .zero,space: 40)
    
    let emailTextField = FaceTextField(placeholder: "Email")
    let passwordTextField = FaceTextField(placeholder: "Password")
    
    let loginButton = FaceButtonNormal(title: "Login", background: .black, borderColor: FaceColors.neonBlue!.cgColor, titleColor: FaceColors.nicePink!, radius: 25)
    let forgetPass = FaceButtonClear(title: "Forget Password?", fontSize: 13)
    let noEmailButton = FaceButtonClear(title: "Creat New Face", fontSize: 18)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Configue()
       textFieldsConfigue()
        layouts()
    }
    
    fileprivate func Configue() {
        
        view.backgroundColor = .black
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        noEmailButton.addTarget(self, action: #selector(creatFacePressed), for: .touchUpInside)
        forgetPass.addTarget(self, action: #selector(forgetPassPressed), for: .touchUpInside)
    }
    
    fileprivate func textFieldsConfigue(){
        emailTextField.addTarget(self, action: #selector(enablingButtons), for: .editingChanged)

        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(enablingButtons), for: .editingChanged)
    }
    
    @objc fileprivate func enablingButtons(){
        if emailTextField.text == "" || passwordTextField.text == ""{
            loginButton.isEnabled = false
            loginButton.alpha = 0.7
        }else{
            loginButton.isEnabled = true
            loginButton.alpha = 1
        }
    }
    
    
    @objc fileprivate func loginPressed(){
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if let err = err {
                self.presentFaceAlertOnMainThread(title: "Ops", message: err.localizedDescription, buttonTitle: "OK")
                return
            }
            self.dismiss(animated: true, completion: nil)
            guard let mainTabBar = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
            mainTabBar.getUser()
        }
    }
    @objc fileprivate func creatFacePressed(){
        if(self.navigationController?.viewControllers.count ?? 0 > 2)
        {
            navigationController?.popViewController(animated: true)
            return
        }
        navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    

    
    @objc fileprivate func forgetPassPressed(){
        presentEmailForgetAlert()
    }
    
    fileprivate func layouts(){
        
        view.addSubview(logoImageView)
        logoImageView.anchorBySize(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 100, bottom: 0, right: 100), size: .init(width: 0, height: 80))
        
        let buttonsStack = FaceStackView(arrangedSubviews: [UIView(),forgetPass], spacing: 10, axis: .horizontal, dis: .fillEqually)
        
        let textfieldsStack = FaceStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton,buttonsStack], spacing: 10, axis: .vertical, dis: .fillEqually)
        view.addSubview(textfieldsStack)
        textfieldsStack.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 120, left: 30, bottom: 0, right: 30), size: .init(width: 0, height: 220))
        textfieldsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
        
        view.addSubview(noEmailButton)
        noEmailButton.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 0), size: .init(width: 0, height: 40))

    }
    
    
    fileprivate func presentEmailForgetAlert() {
        let alertController = UIAlertController(title: "Forget Your Password?", message: "Please input your email:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Send", style: .default) { (_) in
            guard let textFields = alertController.textFields,
                textFields.count > 0 else {
                    // Could not find textfield
                    return
            }
            
            let field = textFields[0]
            guard let text = field.text else { return }
            // store your data
            Auth.auth().sendPasswordReset(withEmail: text) { (err) in
                if let err = err {
                    self.presentFaceAlertOnMainThread(title: "Ops", message: err.localizedDescription , buttonTitle: "ok")
                return
                }
                self.presentFaceAlertOnMainThread(title: "Sent", message: "Cheack you email Adress ,please", buttonTitle: "Done")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
