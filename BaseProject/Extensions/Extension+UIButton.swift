//
//  Extension+UIButton.swift
//  BaseProject
//
//  Created by 강한결 on 7/9/24.
//

import UIKit

extension UIButton.Configuration {
    static func filledCapsule(_ title: String, titleColor: UIColor, backgroundColor: UIColor, image: UIImage?) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        
        config.title = title
        config.titlePadding = 4
        config.imagePadding = 4
        config.baseForegroundColor = titleColor
        config.baseBackgroundColor = backgroundColor
        config.cornerStyle = .capsule
        
        if let image {
            config.image = image
            config.imagePlacement = .leading
        }
        
        return config
    }
    
    static func filledRound(_ title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        
        config.title = title
        config.titleAlignment = .center
        config.baseForegroundColor = titleColor
        config.baseBackgroundColor = backgroundColor
        config.cornerStyle = .medium
        
        return config
    }
    
    static func onlyImage(_ image: UIImage) -> UIButton.Configuration {
        var config = UIButton.Configuration.borderless()
        
        config.image = image
        
        return config
    }
    
    static func onlyTitle(_ title: String, foregroundC: UIColor = .systemBlue) -> UIButton.Configuration {
        var config = UIButton.Configuration.borderless()
        
        config.title = title
        config.baseForegroundColor = foregroundC
        
        return config
    }
}
