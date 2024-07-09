//
//  Extenstion+UIView.swift
//  BaseProject
//
//  Created by 강한결 on 7/8/24.
//

import UIKit

protocol SetId {
    static var id: String { get }
}

extension UIView: SetId {
    static var id: String {
        String(describing: self)
    }
    
    
    func getWindowWidth() -> CGFloat {
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        return window.screen.bounds.width
    }
}
