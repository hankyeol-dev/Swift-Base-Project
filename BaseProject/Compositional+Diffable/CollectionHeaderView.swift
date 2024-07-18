//
//  CollectionHeaderView.swift
//  BaseProject
//
//  Created by 강한결 on 7/18/24.
//

import UIKit
import SnapKit

class CollectionHeaderView: UICollectionReusableView {
    static let identifier = "CollectionHeaderView"
    
    private lazy var titleLabel = {
        var l = UILabel()
        l.font = .systemFont(ofSize: 12, weight: .light)
        l.textColor = .systemGray
        l.numberOfLines = 1
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide).inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(_ t: String) {
        titleLabel.text = t
    }
}

