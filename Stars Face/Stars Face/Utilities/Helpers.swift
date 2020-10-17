//
//  Helpers.swift
//  Stars Face
//
//  Created by samer on 10/1/20.
//  Copyright © 2020 samer. All rights reserved.
//

import UIKit

struct Helper {
    static func ifNotched() -> Bool{
        
        if UIDevice.modelName == "iPhone X" || UIDevice.modelName == "iPhone XS" || UIDevice.modelName == "iPhone XS Max" || UIDevice.modelName == "iPhone XR" || UIDevice.modelName == "iPhone 11" || UIDevice.modelName == "iPhone 11 Pro" || UIDevice.modelName == "iPhone 11 Pro Max"  {
            return true
        }
        return false
    }
    
    static func ifSmallScreen() -> Bool{
        
        if UIDevice.modelName == "iPhone SE (2nd generation)" || UIDevice.modelName == "iPhone 8" || UIDevice.modelName == "iPhone 7" || UIDevice.modelName == "iPhone SE" || UIDevice.modelName == "iPhone 6s" || UIDevice.modelName == "iPhone 6" || UIDevice.modelName == "iPhone 5s" || UIDevice.modelName == "iPhone 5c" || UIDevice.modelName == "iPhone 5" || UIDevice.modelName == "iPhone 4s" || UIDevice.modelName == "iPhone 4"  {
            return true
        }
        return false
    }
    
    static func createNavController(unselectedSysName:String,selectedSysName:String,vc: UIViewController,title: String) -> UINavigationController{
       
        //nav configue
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(systemName: unselectedSysName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))?.withRenderingMode(.alwaysOriginal).withTintColor(.init(white: 1, alpha: 0.6))
        nav.tabBarItem.selectedImage = UIImage(systemName: selectedSysName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold))?.withRenderingMode(.alwaysOriginal).withTintColor(FaceColors.neonBlue!)
        //title
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: FaceColors.nicePink!], for: .selected)
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.6)], for: .normal)
        nav.tabBarItem.title = title
        //nav prefrance
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.isTranslucent = true
        
        return nav
    }
}












