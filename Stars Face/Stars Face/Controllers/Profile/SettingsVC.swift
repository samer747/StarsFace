//
//  SettingsVC.swift
//  Stars Face
//
//  Created by samer on 10/7/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    private let padding : CGFloat = 25
    
    let option1 = GetPointsOptions(image: UIImage(systemName: "textformat.alt")!, text: "Language")
    let option2 = GetPointsOptions(image: UIImage(systemName: "envelope.circle")!, text: "Email Adress")
    let option3 = GetPointsOptions(image: UIImage(systemName: "person.2")!, text: "Invite Friends")
    let option4 = GetPointsOptions(image: UIImage(systemName: "exclamationmark.square")!, text: "Report Problem")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configue()
        configueLayouts()
        configueOptions()
    }
    private func configue(){
        
        view.backgroundColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: FaceColors.nicePink]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        title = "Settings"
        navigationController?.navigationBar.tintColor = FaceColors.neonBlue
        navigationController?.navigationBar.barStyle = .black
    }
    
    
    private func configueLayouts(){
        
        let stack1 = FaceStackView(arrangedSubviews: [option1,option2], spacing: padding, axis: .horizontal, dis: .fillEqually)
        let stack2 = FaceStackView(arrangedSubviews: [option3,option4], spacing: padding, axis: .horizontal, dis: .fillEqually)
        
        let allStack = FaceStackView(arrangedSubviews: [stack1,stack2], spacing: padding, axis: .vertical, dis: .fillEqually)
        
        view.addSubview(allStack)
        allStack.anchorBySize(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: (view.frame.width - padding*2)))
        
    }
    private func configueOptions()
    {
        //   option 1
        let gesture :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeLanguagePressed))
        gesture.numberOfTapsRequired = 1
        option1.isUserInteractionEnabled = true
        option1.addGestureRecognizer(gesture)
        
        //   option 2
        let gesture2 :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChangeEmailAddressPressed))
        gesture2.numberOfTapsRequired = 1
        option2.isUserInteractionEnabled = true
        option2.addGestureRecognizer(gesture2)
        
        //   option 1
        let gesture3 :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(inviteFriendsPressed))
        gesture3.numberOfTapsRequired = 1
        option3.isUserInteractionEnabled = true
        option3.addGestureRecognizer(gesture3)
        
        //   option 1
        let gesture4 :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(reportProblemPressed))
        gesture4.numberOfTapsRequired = 1
        option4.isUserInteractionEnabled = true
        option4.addGestureRecognizer(gesture4)
    }
    
    @objc private func changeLanguagePressed(){
        print("changeLanguagePressed")
    }
    @objc private func ChangeEmailAddressPressed(){
        print("ChangeEmailAddressPressed")
    }
    @objc private func inviteFriendsPressed(){
        print("inviteFriendsPressed")
    }
    @objc private func reportProblemPressed(){
        print("reportProblemPressed")
    }

}
