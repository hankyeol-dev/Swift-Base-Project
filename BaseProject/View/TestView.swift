//
//  TestView.swift
//  BaseProject
//
//  Created by 강한결 on 7/8/24.
//

import UIKit
import SnapKit

final class TestView: BaseView {
    let label_sm = StyledLabel("label_sm", .sub)
    let label_normal = StyledLabel("label_normal", .normal)
    let label_title = StyledLabel("label_title", .title)
    let capsuleButton = StyledCapsuleButton("테스트", backgroundColor: .systemGreen, image: nil)
    let roundedButton = StyledFilledButton("테스트2", titleColor: .systemOrange, backgroundColor: .systemRed)
    
    override func configureSubView() {
        super.configureSubView()
        [label_sm, label_normal, label_title, capsuleButton, roundedButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func configureLayout() {
        super.configureLayout()
        [label_sm, label_normal, label_title].forEach {
            $0.snp.makeConstraints {
                $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
                $0.height.equalTo(32)
            }
        }
        label_sm.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(8)
        }
        label_normal.snp.makeConstraints {
            $0.top.equalTo(label_sm.snp.bottom).offset(8)
        }
        label_title.snp.makeConstraints {
            $0.top.equalTo(label_normal.snp.bottom).offset(8)
        }
        capsuleButton.snp.makeConstraints {
            $0.top.equalTo(label_title.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(40)
            $0.width.equalTo(100)
        }
        roundedButton.snp.makeConstraints {
            $0.top.equalTo(capsuleButton.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(getWindowWidth() / 2)
        }
    }
}
