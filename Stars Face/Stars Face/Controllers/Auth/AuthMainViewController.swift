//
//  SignInViewController.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import Firebase

class AuthMainViewController: UIViewController {
    
    let logoImageView = LogoImageView(frame: CGRect(),space: 10)
    let nextButton = FaceButtonCircle(background: .black, borderColor: FaceColors.neonBlue!.cgColor, innerImageName: "arrow.right",systintColor: FaceColors.neonBlue!, radius: 35)

    
    let textLable : UILabel = {
       let l = UILabel()
        l.text = "Rate people's faces, collect points, and let everyone rate your face"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textColor = FaceColors.lightBlue
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configueLogo()
        confige()
        configeButtons()
    }
    
    
    private func confige(){
        view.backgroundColor = .black
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    
    private func configueLogo(){

        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func configeButtons(){
        nextButton.layer.shadowColor = FaceColors.nicePink?.cgColor
        nextButton.layer.shadowOpacity = 1
        nextButton.layer.shadowRadius = 15

        view.addSubview(nextButton)
        nextButton.heightAnchor.constraint(equalToConstant: 70 ).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 70 ).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nextButton.addTarget(self, action: #selector(getStartedPressed), for: .touchUpInside)
        
        configeText()
    }
    
    private func configeText(){

        view.addSubview(textLable)
        textLable.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: nextButton.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 60, right: 20), size: .zero)
        
    }
    @objc private func getStartedPressed(){
        let x = LoginVC()
        navigationController?.pushViewController(x, animated: true)
    }
}


