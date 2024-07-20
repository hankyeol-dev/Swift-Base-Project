//
//  AuthVC.swift
//  BaseProject
//
//  Created by 강한결 on 7/20/24.
//

import UIKit

protocol LoginNavigation: AnyObject {
    func goToHomeViewController()
}

final class AuthVC: UIViewController {
    
    weak var coordinator: LoginNavigation!
    
    private let loginButton = UIButton()
    
    init(coordinator: LoginNavigation) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginButton)

        loginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(56)
        }
        
        loginButton.configuration = .filled()
        loginButton.configuration?.cornerStyle = .capsule
        loginButton.configuration?.title = "로그인"
        
        loginButton.addTarget(self, action: #selector(onTouchLoginButton), for: .touchUpInside)
    }
    
    @objc func onTouchLoginButton() {
        coordinator.goToHomeViewController()
    }
}
