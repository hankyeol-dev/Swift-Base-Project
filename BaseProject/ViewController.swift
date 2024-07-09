//
//  ViewController.swift
//  BaseProject
//
//  Created by 강한결 on 7/8/24.
//

import UIKit

final class ViewController: BaseViewController {
    private let testView = TestView()
    
    override func loadView() {
        self.view = testView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

