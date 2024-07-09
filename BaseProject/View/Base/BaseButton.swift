//
//  BaseButton.swift
//  BaseProject
//
//  Created by 강한결 on 7/9/24.
//

import UIKit
import SnapKit


class BaseButton: UIButton {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

extension BaseButton {
    func changeToDisabled() {
        self.isEnabled = false
        self.configuration?.baseForegroundColor = .systemGray5
        self.configuration?.baseBackgroundColor = .systemGray
    }
    
    func changeToEnabled() {
        self.isEnabled = true
    }
}
