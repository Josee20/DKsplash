//
//  TabBarController.swift
//  DKsplash
//
//  Created by 이동기 on 2022/10/31.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: TabManViewController())
        firstVC.tabBarItem.image = UIImage(systemName: "photo.fill")
        
        let secondVC = UINavigationController(rootViewController: SearchViewController())
        secondVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        secondVC.navigationController?.isNavigationBarHidden = true
        
        viewControllers = [firstVC, secondVC]
    }
    
    
}
