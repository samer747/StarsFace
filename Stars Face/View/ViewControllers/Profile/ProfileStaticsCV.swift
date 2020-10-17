//
//  ProfileStaticsCV.swift
//  Stars Face
//
//  Created by samer on 10/4/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import Firebase

protocol ProfileOptionsDelegate {
    func ChangeFacePressed()
    func getPointsPressed()
    func settingsPressed()
}

class ProfileStaticsCV: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var delegate : ProfileOptionsDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = FaceColors.blackDark
        collectionView.layer.cornerRadius = 10
        
        collectionView.showsVerticalScrollIndicator = false
        
        self.collectionView!.register(ProfileOptionsCell.self, forCellWithReuseIdentifier: ProfileOptionsCell.reuseID)
        
        
    }
    
    
    //MARK: Cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileOptionsCell.reuseID, for: indexPath) as! ProfileOptionsCell
        switch indexPath.item {
        case 0:
            cell.textLable.text = "Change My Face"
            cell.optionImageView.image = UIImage(systemName: "person.crop.rectangle")
        case 1:
            cell.textLable.text = "Get Points"
            cell.optionImageView.image = UIImage(systemName: "bolt.circle")
        case 2:
            cell.textLable.text = "Settings"
            cell.optionImageView.image = UIImage(systemName: "gear")
        default:
            
            cell.textLable.text = "LogOut"
            cell.optionImageView.image = UIImage(systemName: "square.and.arrow.up")
            cell.seprator.isHidden = true
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let H: CGFloat = Helper.ifSmallScreen() ? 70 : (view.frame.height / 4)
        
        return .init(width: view.frame.width, height: H)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0: //Change Face
            delegate.ChangeFacePressed()
        case 1: //get points
            delegate.getPointsPressed()
        case 2: // settings
            delegate.settingsPressed()
        default://logout
            SignOutPressed()
            
        }
    }
    
    
    private func SignOutPressed(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "LogOut", style: .destructive, handler: { (_) in
            do {
                try Auth.auth().signOut()
                let signInController = AuthMainViewController()
                let navgation = UINavigationController(rootViewController: signInController)
                self.navigationController?.navigationBar.barTintColor = .black
                navgation.modalPresentationStyle = .fullScreen
                self.present(navgation, animated: true, completion: nil)
            } catch let err
            {
                print("error :",err)
            }
            
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true , completion: nil)
    }
}
