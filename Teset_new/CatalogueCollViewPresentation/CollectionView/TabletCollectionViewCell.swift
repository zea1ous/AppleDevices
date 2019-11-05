//
//  TabletCollectionViewCell.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 05.11.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

class TabletCollectionViewCell: OfferCollectionViewCell {
    
    static let tabletCellID: String = "tabletCellID"
    
    override func makeLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        deviceImageView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(180)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(deviceImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
    }
    
}


