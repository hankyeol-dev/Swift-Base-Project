//
//  StyledCapsuleButton.swift
//  BaseProject
//
//  Created by 강한결 on 7/9/24.
//

import UIKit
import SnapKit


final class StyledCapsuleButton: BaseButton {
    convenience init(_ title: String, titleColor: UIColor = .white, backgroundColor: UIColor = .systemBlue, image: UIImage?) {
        self.init(frame: .zero)
        self.configuration = .filledCapsule(title, titleColor: titleColor, backgroundColor: backgroundColor, image: image ?? nil)
    }
}
