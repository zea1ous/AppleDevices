//
//  BannerCollectionHeaderView.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 05.11.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

final class BannerCollectionHeaderView: UICollectionReusableView {
    
    static let headerID: String = "BannerCollectionHeaderView"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "banner")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview()
        }
        
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTap(_ :)))
        addGestureRecognizer(gesture)
    }
    
    @objc private func didTap(_ recognizer: UITapGestureRecognizer) {
        guard let url = URL(string: "https://apps.apple.com/app/apple-store/id375380948") else { return }
        UIApplication.shared.open(url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
