//
//  StyledFilledButton.swift
//  BaseProject
//
//  Created by 강한결 on 7/9/24.
//

import UIKit

final class StyledFilledButton: BaseButton {
    convenience init(_ title: String, titleColor: UIColor = .white, backgroundColor: UIColor = .systemBlue) {
        self.init(frame: .zero)
        self.configuration = .filledRound(title, titleColor: titleColor, backgroundColor: backgroundColor)
    }
}
