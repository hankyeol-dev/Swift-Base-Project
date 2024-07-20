//
//  HomeTabbarCoordinator.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

final class HomeTabbarCoordinator: CoordinatorProtocol {
    weak var parentCoordinator: (any CoordinatorProtocol)?
    
    var children: [CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
        print("HomeTabbar start")
        goToHomeTabbar()
    }
    
    deinit {
        print("HomeTabbar end")
    }
}

extension HomeTabbarCoordinator {
    func goToHomeTabbar() {
        let tabbarController = UITabBarController()
        
        /// === homeVC를 위한 navigation
        let homeNavigation = UINavigationController()
        let homeCoordinator = HomeCoordinator(nav: homeNavigation) // 주입
        homeCoordinator.parentCoordinator = parentCoordinator // 자식 객체에 parent를 각각 등록
        homeNavigation.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house.circle.fill"), tag: 1)
        
        /// === profileVC를 위한 navigation
        let profileNavigation = UINavigationController()
        let profileCoordinator = ProfileCoordinator(nav: profileNavigation)
        profileCoordinator.parentCoordinator = parentCoordinator
        profileNavigation.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person.circle.fill"), tag: 2)
        
        tabbarController.viewControllers = [homeNavigation, profileNavigation]
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(tabbarController, animated: true)
        
        parentCoordinator?.children.append(homeCoordinator)
        parentCoordinator?.children.append(profileCoordinator)
        
        homeCoordinator.start()
        profileCoordinator.start()
    }
}
