//
//  TabBarController.swift
//  HomeWork#6
//
//  Created by Andrey on 09.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllersConfiguration()
        tabBarConfiguration()
    }
    
    func tabBarConfiguration() {
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = .black
        tabBar.tintColor = .red
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.layer.borderWidth = 0
        tabBar.clipsToBounds = false
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    func viewControllersConfiguration() {
        viewControllers = [
            createNavController(for: CourseTableViewController(), title: "AutoLayout", image: UIImage(systemName: "circle.dashed")!),
            createNavController(for: XIBViewController.loadFromNib(), title: "XIB", image: UIImage(systemName: "circle.dashed.inset.filled")!),
            createNavController(for: ManualViewController(), title: "Manual", image: UIImage(systemName: "square.dashed")!),
            createNavController(for: NavViewController(), title: "Navigation", image: UIImage(systemName: "square.dashed.inset.filled")!),
            createNavController(for: LargeNavViewController(), title: "Large Nav", image: UIImage(systemName: "eye.slash")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
