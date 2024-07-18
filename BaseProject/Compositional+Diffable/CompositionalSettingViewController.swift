//
//  CompositionalSettingViewController.swift
//  BaseProject
//
//  Created by 강한결 on 7/18/24.
//

import UIKit
import SnapKit

/**
 1. CollectionView는 기본적으로 Layout에 대한 정의가 필요하다. (`FlowLayout`  vs. `listConfiguration` vs. ...)
 2. List 형태의 CollectionView에서 활용할 Cell Data 형식을 정의한다. (Hashable, Identifiable ..)
 3. List 형태의 CollectionView에서 활용할 Cell (item)형식을 정의한다. (CellRegistration - system item)
 4. dataSource에 대한 Section 구분 타입, Cell Item 타입을 정의한다.
 5. dataSource에 cell을 연결시켜준다. (실질적으로는 어떤 셀을 어떤 indexPath에서 사용할 것인지 등록하는 과정)
 6. dataSource에 스냅샷 형태로 섹션, 섹션별 아이템을 업데이트 해준다.
 */



final class CompositionalSettingViewController: UIViewController {
    // 1
    private lazy var settingCollection = {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.backgroundColor = .white
//        config.headerMode = .supplementary
        
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout.list(using: config))
    }()
    
    // 4
    var diffableDataSource: UICollectionViewDiffableDataSource<SettingSections, Setting>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "설정"
        
        view.addSubview(settingCollection)
        settingCollection.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        registerCell()
        updateSnapshotToDataSource()
    }
    
    private func registerCell() {
        // 3
        let cellRegistration = UICollectionView.CellRegistration { (cell, indexPath, item: Setting) in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = item.title
            content.secondaryText = item.description != nil ? item.description : ""
            content.image = item.image
            
            var background = UIBackgroundConfiguration.listGroupedCell()
            background.backgroundColor = .systemGray6
            
            cell.contentConfiguration = content
            cell.backgroundConfiguration = background
        }
        
        // 5
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: settingCollection, cellProvider: { collectionView, indexPath, item in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: item
            )
        })
        
        diffableDataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }
            
            let title = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: CollectionHeaderView.id, for: indexPath
            ) as? CollectionHeaderView
            
            let section = self?.diffableDataSource.snapshot().sectionIdentifiers[indexPath.section]
            title?.setTitle(section?.rawValue ?? "섹션 타이틀입니다.")
            
            return title
        }
    }
    
    private func updateSnapshotToDataSource() {
        // 6
        var snapshot = NSDiffableDataSourceSnapshot<SettingSections, Setting>()
        
        snapshot.appendSections(SettingSections.allCases)
        snapshot.appendItems(settingItems, toSection: .modeSetting)
        snapshot.appendItems([Setting(title: "모든 기기에서 공유", description: nil, image: .checkmark)], toSection: .shared)
        
        diffableDataSource.apply(snapshot)
    }
}
