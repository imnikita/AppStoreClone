//
//  TheBaseTabBarController.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 14.03.2021.
//

import UIKit

class BaseTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super .viewDidLoad()

        viewControllers = [
            createNavController(viewController: TodayController(), title: "Today", imageName: "note.text"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps.iphone"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "doc.text.magnifyingglass")
            ]
        
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController{
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        
        return navController
        
    }
}
