//
//  BaseViewController.swift
//  BaseProject
//
//  Created by 강한결 on 7/8/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAction()
    }

    /**
     뷰 객체에 이벤트 액션을 맵핑하는 메서드
     */
    func configureAction() {}
}

extension BaseViewController {
    /**
     NavigationBar를 세팅하는 메서드
     - left item, right item은 반영이 필요한 경우에만 반영 (default: nil)
     */
    func configureNav(title: String, leftBarItem: UIBarButtonItem?, rightBarItem: UIBarButtonItem?) {
        self.title = title
        
        if let left = leftBarItem {
            navigationItem.leftBarButtonItem = left
        }
        
        if let right = rightBarItem {
            navigationItem.rightBarButtonItem = right
        }
    }
        
    /**
     네비게이션 컨트롤상 이전 페이지로 POP하는 버튼 아이템
     - 왼쪽 화살표 이미지(< 모양)의 버튼 삽입
     */
    func genLeftWithGoBack(_ c: UIColor?) -> UIBarButtonItem {
        let left = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        
        if let color = c {
            left.tintColor = c
        } else {
            left.tintColor = .systemGray
        }
        
        return left
    }
    
    /**
     인자로 입력 받은 ViewController로 PUSH하는 메서드
     - 두 번째 인자로 넣는 클로저를 통해서 이동하려는 VC의 인스턴스 컨택스에 필요한 액션을 취할 수 있음
     */
    func goSomeVC<T: UIViewController>(vc: T, vcHandler: @escaping (T) -> ()) {
        vcHandler(vc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /**
     인자로 입력 받은 ViewController를 Present하는 메서드
     - 두 번째 인자로 넣는 클로저를 통해서 이동하려는 VC의 인스턴스 컨택스에 필요한 액션을 취할 수 있음
     */
    func presentSomeVC<T: UIViewController>(vc: T, vcHandler: @escaping (T) -> ()) {
        vcHandler(vc)
        present(vc, animated: true)
    }
}

extension BaseViewController {
    /**
     Navigation Controller 상의 이전 VC로 POP시키는 메서드
     */
    @objc
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
