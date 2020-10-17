//
//  ProfileVC.swift
//  Stars Face
//
//  Created by samer on 10/3/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class ProfileVC: UIViewController  {


    var user : User!{
        didSet{
            loadUserData()
        }
    }
    
    let profileStaticsCV = ProfileStaticsCV(collectionViewLayout: UICollectionViewFlowLayout())
    
    let containerTNS1 = TextNumSepratorContainerView(number: "0.0", text: "Rate")
    let containerTNS2 = TextNumSepratorContainerView(number: "0", text: "Points")
    let containerTNS3 = TextNumSepratorContainerView(number: "0", text: "Raters")
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = FaceColors.blackDark
        v.clipsToBounds = true
        v.alpha = 0.9
        v.layer.cornerRadius = 10
        return v
    }()
    
    let containerView2 : UIView = {
        let v = UIView()
        v.backgroundColor = FaceColors.blackDark
        v.clipsToBounds = true
        v.layer.cornerRadius = 10
        return v
    }()
    
    let nameLable : UILabel = {
        let l = UILabel()
        l.text = ""
        l.textColor = FaceColors.neonBlue
        l.minimumScaleFactor = 0.7
        l.adjustsFontSizeToFitWidth   = true
        l.font = FaceFonts.ArialRoundedMTBold
        return l
    }()
    
    let customView = UIView()
    
    
    let profileImageView = Helper.ifNotched() ?                                                                                                         gradiantImageView(innerImage: FaceImages.EmptyProfilePic!, upHeight: 150, upAlpha: 0.9, downHeight: 66, downAlpha: 0.8)  :     /*notched*/                     gradiantImageView(innerImage: FaceImages.EmptyProfilePic!, upHeight: 100, upAlpha: 0.9, downHeight: 66, downAlpha: 0.8)       /*not notched*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileStaticsCV.delegate = self
        
        confige()
        configeNavBar()
        configueLayoust()
        
    }
    
    fileprivate func confige(){
        view.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.profileImageView.contentMode = .scaleAspectFill
    }
    
    fileprivate func configeNavBar(){
        // Right
        let settingB = UIBarButtonItem(image: UIImage(systemName: "pencil.circle")?.withTintColor(FaceColors.nicePink!, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(settingPressed))
        navigationItem.rightBarButtonItem = settingB
        
        // Left
        customView.addSubview(nameLable)
        nameLable.fillSuperview()
        let leftButton = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    fileprivate func configueLayoust(){
        view.addSubview(profileImageView)
        profileImageView.anchorBySize(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: (view.frame.width )))
        
        view.addSubview(containerView)
        containerView.anchorBySize(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 80))
        containerView.centerYAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
        
        containerTNS1.seprator.alpha = 0
        
        let containerStack = FaceStackView(arrangedSubviews: [containerTNS1,containerTNS2,containerTNS3], spacing: 0, axis: .horizontal, dis: .fillEqually)
        view.addSubview(containerStack)
        containerStack.anchorBySize(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 13, left: 15, bottom: 10, right: 15), size: .zero)
        
        view.addSubview(containerView2)
        containerView2.anchorBySize(top: containerView.bottomAnchor, leading: containerView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 15, right: 0), size: .zero)
        
        view.addSubview(profileStaticsCV.view)
        profileStaticsCV.view.anchorBySize(top: containerView2.topAnchor, leading: containerView2.leadingAnchor, bottom: containerView2.bottomAnchor, trailing: containerView2.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .zero)
    }
    
    fileprivate func loadUserData() {
        profileImageView.sd_setImage(with: URL(string: user.faceLink))
        nameLable.text = user.userName
        containerTNS1.numberLable.text = "\(user.rate)"
        containerTNS2.numberLable.text = "\(user.points)"
        
        Database.database().reference().child("raters").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            self.containerTNS3.numberLable.text = String(snapshot.childrenCount)
        }) { (err) in
            print(err)
        }
    }
    
    @objc fileprivate func settingPressed(){
        DispatchQueue.main.async {
            let alertVC = FaceChangeNameVC()
            alertVC.delegate = self
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}

extension ProfileVC : ProfileOptionsDelegate {
    func getPointsPressed() {
        
        let getPoints = GetPointsVC()
        
        self.navigationController?.pushViewController(getPoints, animated: true)
    }
    
    func settingsPressed() {
        let settingsVC = SettingsVC()
        
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    func ChangeFacePressed() {
        let photoSelectorController = PhotoSelectorController(collectionViewLayout: UICollectionViewFlowLayout())
        let navController = UINavigationController(rootViewController: photoSelectorController)
        navController.modalPresentationStyle = .fullScreen
        present(navController,animated: true,completion: nil)
    }
}


extension ProfileVC : changeNameDelegate {
    func nameChanged(newName: String) {
        self.nameLable.text = newName
    }

}
