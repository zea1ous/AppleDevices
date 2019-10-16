//
//  DeviceTableViewCell.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 16.10.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        snapViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    internal func configure(_ device: Device) {
        nameLabel.text = device.name
        priceLabel.text = "\(device.price) $"
    }
    
    private func snapViews() {
        let priceLabelTop = NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 16)
        let priceLabelBottom = NSLayoutConstraint(item: priceLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -16)
        let priceLabelRight = NSLayoutConstraint(item: priceLabel, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: -16)
        let priceLabelWidth = NSLayoutConstraint(item: priceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        NSLayoutConstraint.activate([priceLabelTop, priceLabelBottom, priceLabelRight, priceLabelWidth])
        
        let nameLabelTop = NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 16)
        let nameLabelBottom = NSLayoutConstraint(item: nameLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -16)
        let nameLabelRight = NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: priceLabel, attribute: .left, multiplier: 1, constant: -16)
        let nameLabelLeft = NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 16)
        NSLayoutConstraint.activate([nameLabelTop, nameLabelBottom, nameLabelRight, nameLabelLeft])
    }
}
