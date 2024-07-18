//
//  CollectionCellItems.swift
//  BaseProject
//
//  Created by 강한결 on 7/18/24.
//

import UIKit

struct Setting: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let image: UIImage
}

let settingItems: [Setting] = [
    Setting(title: "방해금지모드", description: nil, image: UIImage(systemName: "moon.fill")!),
    Setting(title: "수면", description: nil, image: UIImage(systemName: "bed.double.fill")!),
    Setting(title: "업무", description: "09:00 - 18:00", image: UIImage(systemName: "lanyardcard.fill")!),
    Setting(title: "개인시간", description: nil, image: UIImage(systemName: "person.fill")!)
]
