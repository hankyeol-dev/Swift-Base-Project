//
//  ProfileCoordinator.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

final class ProfileCoordinator: CoordinatorProtocol {
    var parentCoordinator: (any CoordinatorProtocol)?
    
    var children: [any CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    func start() {
        goToProfileVC()
    }
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func goToProfileVC() {
        let profile = ProfileVC()
        profile.coordinator = self
        navigationController.pushViewController(profile, animated: true)
    }
}

extension ProfileCoordinator: ProfileNavigation {
    func goToAuth() {
        let appCoordinator = parentCoordinator as? AppCoordinator
        appCoordinator?.startAuthCoordinator()
    }
}
