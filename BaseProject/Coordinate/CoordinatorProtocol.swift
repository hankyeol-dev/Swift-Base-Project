//
//  CoordinatorProtocol.swift
//  BaseProject
//
//  Created by 강한결 on 7/19/24.
//

import UIKit

/// coordinating을 위한 프로토콜
/// - parentCoordinator: 자신보다 상위의 Coordinator로 직계 자식이 아닌 View의 Coordinator에 요청을 보내기 위해 존재한다.
/// - children: 자신의 직계 자식 View
/// - navigationController: 말 그대로 뷰 네비게이팅을 위한 객체
/// - start()
protocol CoordinatorProtocol: AnyObject {
    var parentCoordinator: CoordinatorProtocol? { get set }
    var children: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension CoordinatorProtocol {
    func childDidFinish(_ coordinator: CoordinatorProtocol) {
        children.enumerated().forEach { idx, child in
            if child === coordinator {
                children.remove(at: idx)
                return
            }
        }
    }
}
