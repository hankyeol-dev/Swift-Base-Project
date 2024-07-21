//
//  ReuseCollectionItem.swift
//  BaseProject
//
//  Created by 강한결 on 7/21/24.
//

import UIKit

final class ReuseCollectionItem: UICollectionViewCell {
    private let back = UIView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(back)
        back.addSubview(label)
        
        let colors: [UIColor] = [
            UIColor.blue,
            UIColor.green,
            UIColor.systemMint,
            UIColor.purple
        ].compactMap({ $0 })
        back.backgroundColor = colors.randomElement()
        label.text = "collection Item"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        back.frame = contentView.bounds
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
