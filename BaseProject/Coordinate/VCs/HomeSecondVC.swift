//
//  HomeSecondViewController.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit
import SnapKit


final class HomeSecondVC: UIViewController {
    
    weak var navigator: HomeNavigation?
    
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
        navigator?.goToAuth()
    }
}
