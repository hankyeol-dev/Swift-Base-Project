//
//  HomeCoordinator.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    var parentCoordinator: (any CoordinatorProtocol)?
    
    var children: [any CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    func start() {
        showHomeVC()
    }
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func showHomeVC() {
        let home = HomeVC()
        home.navigator = self
        navigationController.pushViewController(home, animated: true)
    }
}

extension HomeCoordinator: HomeNavigation {
    func goToAuth() {
        // logout event
        let appCoordinator = parentCoordinator as? AppCoordinator
        appCoordinator?.startAuthCoordinator()
    }
    
    func goToHomeSecond() {
        let homeSecond = HomeSecondVC()
        homeSecond.navigator = self
        navigationController.pushViewController(homeSecond, animated: true)
    }
}
