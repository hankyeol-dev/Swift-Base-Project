//
//  StyledLabel.swift
//  BaseProject
//
//  Created by 강한결 on 7/8/24.
//

import UIKit
import SnapKit

enum LabelStyleType {
    case normal, sub, title, largeTitle, impact, error, success
}

final class StyledLabel: BaseView {
    private var style: LabelStyleType = .normal
    
    private let label = UILabel()
    
    convenience init(_ t: String, _ type: LabelStyleType) {
        self.init(frame: .zero)
        self.label.text = t
        self.style = type
        configureView()
    }
    
    override func configureSubView() {
        self.addSubview(label)
    }
    
    override func configureLayout() {
        label.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(8)
        }
    }
    
    override func configureView() {
        configureFont(self.style)
    }
    
    private func configureFont(_ style: LabelStyleType) {
        switch style {
        case .normal:
            label.font = .systemFont(ofSize: 15)
        case .sub:
            label.font = .systemFont(ofSize: 13)
        case .title:
            label.font = .boldSystemFont(ofSize: 15)
        case .largeTitle:
            label.font = .boldSystemFont(ofSize: 24)
        case .impact:
            label.font = .boldSystemFont(ofSize: 20)
        case .error:
            label.font = .systemFont(ofSize: 15)
            label.textColor = .systemRed
        case .success:
            label.font = .systemFont(ofSize: 15)
            label.textColor = .systemGreen
        }
    }
    
    func changeText(_ t: String) {
        label.text = t
    }
    
    func changeStyle(_ style: LabelStyleType) {
        self.style = style
        self.configureFont(style)
    }
}
