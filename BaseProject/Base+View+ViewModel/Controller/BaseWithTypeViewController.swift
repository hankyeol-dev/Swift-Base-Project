//
//  BaseWithTypeViewController.swift
//  BaseProject
//
//  Created by 강한결 on 7/18/24.
//

import UIKit

protocol InjectedViewModelProtocol: AnyObject { }
protocol InjectedViewProtocol: UIView { }

/**
 BaseWithTypeViewController
 - BaseViewController를 상속받고, 타입 추론으로 ViewModel, MainView를 주입 받을 수 있는 베이스 컨트롤러
 */
class BaseWithTypeViewController<VM: InjectedViewModelProtocol, MV: InjectedViewProtocol>: UIViewController {
    
    weak var viewModel: VM?
    weak var mainView: MV?
    
    init(vm: VM, mv: MV) {
        super.init(nibName: nil, bundle: nil)
        viewModel = vm
        mainView = mv
    }
    
    override func loadView() {
        guard let mainView else { return }
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
