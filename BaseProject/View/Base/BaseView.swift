//
//  BaseView.swift
//  BaseProject
//
//  Created by 강한결 on 7/8/24.
//

import UIKit

class BaseView: UIView {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubView()
        configureLayout()
        configureView()
    }
    
    /**
     뷰에 자식 뷰를 추가하는 메서드
     - view.addSubview(someview)
     */
    func configureSubView(){}
    
    /**
     Snapkit 라이브러리를 활용하여 뷰 객체의 레이아웃을 잡는 메서드
     - someview.snp.makeConstraint { }
     */
    func configureLayout(){}
    
    /**
     뷰 객체의 UI 코드를 작성하고, 데이터 맵핑을 진행
     - someview.text = "someview"
     - someview.textColor = .red
     */
    func configureView(){}
}

extension BaseView {
    /**
     인자로 받은 데이터를 기반으로 뷰 객체를 설정하는 메서드
     */
    func configureViewWithData<T>(_ data: T) { }
    
    /**
     UIControl을 상속받는 뷰 객체에게 이벤트를 맵핑하는 메서드
     - addAction(someButton, target: self, selector: #selector(someMethod), event: .touchUpInside)
     */
    func addAction<T: UIControl>(_ component: T, target: Any?, selector: Selector, event: UIControl.Event) {
        component.addTarget(target, action: selector, for: event)
    }
}
