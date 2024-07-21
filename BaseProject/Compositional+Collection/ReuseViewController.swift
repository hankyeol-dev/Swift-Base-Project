//
//  ReuseViewController.swift
//  BaseProject
//
//  Created by 강한결 on 7/21/24.
//

import UIKit

final class ReuseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private lazy var collection = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCollectionView()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collection)
        view.backgroundColor = .white
        
        collection.register(ReuseCollectionItem.self, forCellWithReuseIdentifier: ReuseCollectionItem.id)
        collection.frame = view.bounds
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 4
        case 3:
            return 4
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseCollectionItem.id, for: indexPath) as! ReuseCollectionItem
        return cell
    }
}

extension ReuseViewController {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
        )
        
        // group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(2/5)
            ),
            subitem: item,
            count: 2
        )
        
        // sections
        let section = NSCollectionLayoutSection(group: group)
        
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func makeCollectionView() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex,_) -> NSCollectionLayoutSection? in
            return self.createSection(for: sectionIndex)
        }
        
        return layout
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        switch sectionIndex {
        case 0:
            return createTwoColumnSection(weightConstant: sectionIndex)
        case 1:
            return createSingleColumnSection()
        case 2:
            return createTwoColumnSection(weightConstant: sectionIndex)
        case 3:
            return createHorizontalScrollingSection()
        default:
            return createSingleColumnSection() // 임시로 넣어놨다. 섹션은 0~3까지고, 여기 도달할 일없지만, 만약 도달하면 error니까 제대로 된 error 처리 요망
        }
    }
    
    private func createTwoColumnSection(weightConstant :Int) -> NSCollectionLayoutSection {
        let weight = (Double(weightConstant) * 0.05)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .fractionalHeight(0.98))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.1 + weight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.flexible(10.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15.0
        
        return section
    }
    
    private func createSingleColumnSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.05))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    private func createHorizontalScrollingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
