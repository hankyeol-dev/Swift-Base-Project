//
//  AuthCoordinator.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

final class AuthCoordinator: CoordinatorProtocol {
    
    weak var parentCoordinator: CoordinatorProtocol?
    
    var children: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
        // setup initial VC here -> 즉, AuthVC를 보여줘라! 라는 뜻
        let auth = AuthVC(coordinator: self)
        navigationController.viewControllers.removeAll() // 다시 돌아오면, 일단 쌓인거 다 지워줘야 함
        navigationController.pushViewController(auth, animated: true)
    }
}

extension AuthCoordinator: LoginNavigation {
    // AuthVC에 접목될 Coordinator이기 때문에
    // 해당 VC에서 구현한 navigation interface를 해당 coordinator에 구현해준다.
    
    /// coordination flow
    /// authVC > loginButtonTouched > authCoord goToHomeVC > childDidFinish > appCoord startHomeTabbar > HomeVC
    func goToHomeViewController() {
        
        let appCoordinator = parentCoordinator as? AppCoordinator
        
        appCoordinator?.startHomeTabbarCoordinator()
        appCoordinator?.childDidFinish(self)
    }
}
