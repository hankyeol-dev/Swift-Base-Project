//
//  ProfileVC.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

protocol ProfileNavigation: AnyObject {
    func goToAuth()
}

final class ProfileVC: UIViewController {
    
    weak var coordinator: ProfileNavigation!
    
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(56)
        }
        
        logoutButton.configuration = .filled()
        logoutButton.configuration?.cornerStyle = .capsule
        logoutButton.configuration?.title = "로그아웃"
        
        logoutButton.addTarget(self, action: #selector(onTouchLogoutButton), for: .touchUpInside)
    }
    
    @objc func onTouchLogoutButton() {
        coordinator?.goToAuth()
    }
}
