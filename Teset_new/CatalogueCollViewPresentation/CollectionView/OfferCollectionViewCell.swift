//
//  OfferCollectionViewCell.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 05.11.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "offerCellID"
    
    let deviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    func configure(with device: Device) {
        nameLabel.text = device.name
        priceLabel.text = "\(device.price) $"
        
        guard let image = device.image else {
            guard let url = device.url else {
                deviceImageView.sd_setImage(with: URL(string: "https://static.svyaznoy.ru/upload/iblock/e6e/iphone_11_pro_sg_2.jpg"), placeholderImage: nil)
                return
            }
            
            deviceImageView.sd_setImage(with: URL(string: url), placeholderImage: nil)
            
            return
        }
        deviceImageView.image = image
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = .white
        
        [nameLabel, deviceImageView, priceLabel].forEach { contentView.addSubview($0) }
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // override this
     func makeLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        deviceImageView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(nameLabel)
            $0.height.equalTo(120)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(deviceImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
    }
}
