//
//  AppCoordinator.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    weak var parentCoordinator: CoordinatorProtocol?
    
    var children: [CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
        print("AppCoordinator init")
        startAuthCoordinator()
    }
    
    deinit {
        print("AppCoordinator Deinit")
    }
}

extension AppCoordinator {
    func startAuthCoordinator() {
        let authCoordinator = AuthCoordinator(nav: navigationController)
        children.removeAll() // AppCoordinator의 자식을 다 삭제해주고
        authCoordinator.parentCoordinator = self // 이동하려는 Coordinator에게(=자식) 자신을 부모로 등록
        children.append(authCoordinator) // 자식 배열에 이동하려는 Coordinator 등록
        authCoordinator.start()
    }
    
    func startHomeTabbarCoordinator() {
        let homeTabbarCoordinator = HomeTabbarCoordinator(nav: navigationController)
        children.removeAll()
        homeTabbarCoordinator.parentCoordinator = self
        homeTabbarCoordinator.start()
    }
}
