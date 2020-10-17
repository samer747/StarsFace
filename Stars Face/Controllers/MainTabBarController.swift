//
//  MainTabBarController.swift
//  Stars Face
//
//  Created by samer on 9/29/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    var user : User!{
        didSet{
            setupTaps()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        tabBar.isTranslucent = true
        tabBar.barTintColor = .black
        
        if Auth.auth().currentUser == nil {
            
            let navAuthPage = UINavigationController(rootViewController: AuthMainViewController())
            navAuthPage.modalPresentationStyle = .fullScreen
            navAuthPage.navigationBar.isHidden = true
            self.present(navAuthPage, animated: true, completion: nil)
            
        }else{
            getUser()
        }
    }
    
    func setupTaps(){

        
            //      Home
            let homeVC = HomeVC()
            homeVC.tabBarItem.image = UIImage(systemName: "house", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))?.withRenderingMode(.alwaysOriginal).withTintColor(.init(white: 1, alpha: 0.6))
            homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))?.withRenderingMode(.alwaysOriginal).withTintColor(FaceColors.neonBlue!)
            homeVC.title = "Faces"
            homeVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: FaceColors.nicePink! ], for: .selected)
            homeVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.6)], for: .normal)
            
            //      Search
            let searchVC = SearchVC(collectionViewLayout: UICollectionViewLayout())
            searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))?.withRenderingMode(.alwaysOriginal).withTintColor(.init(white: 1, alpha: 0.6))
            searchVC.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))?.withRenderingMode(.alwaysOriginal).withTintColor(FaceColors.neonBlue!)
            searchVC.title = "Search"
            searchVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: FaceColors.nicePink! ], for: .selected)
            searchVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.6)], for: .normal)
            
            //      Profile
            let profile = ProfileVC()
            profile.user = self.user
            let profileVC = Helper.createNavController(unselectedSysName: "person.circle", selectedSysName: "person.circle.fill", vc: profile, title: "Profile")
            
            self.viewControllers = [homeVC,searchVC,profileVC]
        
    }
    

    
     func getUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        NetworkManger.shared.fetchUser(uid: uid) { (user) in
            self.user = user
        }
    }
    
}
