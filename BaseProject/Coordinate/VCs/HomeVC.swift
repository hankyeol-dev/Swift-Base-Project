//
//  HomeVC.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit
import SnapKit

protocol HomeNavigation: AnyObject {
    func goToAuth()
    func goToHomeSecond()
}

final class HomeVC: UIViewController {
    
    weak var navigator: HomeNavigation?
    
    private let secondHomeButton = UIButton()
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(secondHomeButton)
        view.addSubview(logoutButton)
        
        secondHomeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(56)
        }
        logoutButton.snp.makeConstraints { make in
            make.centerX.equalTo(secondHomeButton.snp.centerX)
            make.top.equalTo(secondHomeButton.snp.bottom).offset(16)
            make.height.equalTo(56)
        }
        
        secondHomeButton.configuration = .filled()
        secondHomeButton.configuration?.cornerStyle = .capsule
        secondHomeButton.configuration?.title = "세컨 홈 화면으로 이동"
        logoutButton.configuration = .filled()
        logoutButton.configuration?.cornerStyle = .capsule
        logoutButton.configuration?.title = "로그아웃"
        
        secondHomeButton.addTarget(self, action: #selector(onTouchSecondHomeButton), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(onTouchLogoutButton), for: .touchUpInside)
    }
    
    @objc func onTouchSecondHomeButton() {
        navigator?.goToHomeSecond()
    }
    
    @objc func onTouchLogoutButton() {
        navigator?.goToAuth()
    }
}
