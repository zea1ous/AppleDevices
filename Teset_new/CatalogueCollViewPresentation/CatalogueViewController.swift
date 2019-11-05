//
//  CatalogueViewController.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 05.11.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit
import SnapKit

final class CatalogueViewController: UIViewController {
    
    private enum CellType: Int {
        case offer = 0
        case tablet
        case sale
    }
    let storage: StorageInterace
    
    private let baseInset: CGFloat = 8
    
    private var categories: [[Device]] {
        return storage.getCategories()
    }
    private let cellIdentifier: String = "cellIdentifier" // bad name for identifier
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    
    private lazy var devicesCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: OfferCollectionViewCell.identifier)
        collection.register(TabletCollectionViewCell.self, forCellWithReuseIdentifier: TabletCollectionViewCell.tabletCellID)
        collection.register(BannerCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BannerCollectionHeaderView.headerID)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = UIColor.systemGroupedBackground
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    init(storage: StorageInterace) {
        self.storage = storage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Apple Shop"
        view.addSubview(devicesCollectionView)
        devicesCollectionView.snp.makeConstraints {
//            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.edges.equalToSuperview()
        }
    }
}

extension CatalogueViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let baseCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        baseCell.backgroundColor = .red
        
        switch indexPath.section {
        case CellType.offer.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.identifier, for: indexPath) as? OfferCollectionViewCell else {
                return baseCell
            }
            cell.configure(with: categories[indexPath.section][indexPath.item])
            return cell
        case CellType.tablet.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabletCollectionViewCell.tabletCellID, for: indexPath) as? TabletCollectionViewCell else {
                return baseCell
            }
            cell.configure(with: categories[indexPath.section][indexPath.item])
            return cell
        default:
            return baseCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var headerView = UICollectionReusableView()
        guard indexPath.section == CellType.offer.rawValue else { return headerView }
        
        if kind == UICollectionView.elementKindSectionHeader,
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BannerCollectionHeaderView.headerID, for: indexPath) as? BannerCollectionHeaderView {
            header.nameLabel.text = "Go to the AppStore"
            headerView = header
        }
        
        return headerView
    }
    
}

extension CatalogueViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard section == CellType.offer.rawValue else { return .zero }
        return CGSize(width: view.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 220
        let width: CGFloat
        
        switch indexPath.section {
        case 1:
            width = view.frame.width - baseInset * 2
            height = 300
        case 2:
            width = (view.frame.width - (baseInset * 5))/4
            height = 100
        default:
            width = (view.frame.width - (baseInset * 3))/2
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        case 1:
            return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        case 2:
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        default:
            return .zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section != 2 else { return }
        let device = categories[indexPath.section][indexPath.item]
        let vc = DetailViewController(device: device)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

