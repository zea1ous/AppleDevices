//
//  DetailViewController.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 16.10.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    private let device: Device
    
    private lazy var deviceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buyThisShitButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
//        button.backgroundColor = UIColor.init(displayP3Red: 50/255, green: 99/255, blue: 207/255, alpha: 1)

        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("BUY NOW", for: .normal)
        button.addTarget(self, action: #selector(handleBuy(_ :)), for: .touchUpInside)
        return button
    }()
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
        
        configure(device)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        [deviceImage, nameLabel, priceLabel, buyThisShitButton].forEach { subView in
            view.addSubview(subView)
        }
        snapViews()
    }
    
    @objc private func handleBuy(_ sender: UIButton) {
        print("I've got this shit! AWESOME!")
    }
    
    private func configure(_ device: Device) {
        nameLabel.text = device.name
        priceLabel.text = "\(device.price) $"
        title = device.name
        
        guard let image = device.image else {
            guard let url = device.url else {
                deviceImage.sd_setImage(with: URL(string: "https://static.svyaznoy.ru/upload/iblock/e6e/iphone_11_pro_sg_2.jpg"), placeholderImage: nil)
                return
            }
            
            deviceImage.sd_setImage(with: URL(string: url), placeholderImage: nil)
            
            return
        }
        deviceImage.image = image
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        buyThisShitButton.frame = CGRect(
            x: 32,
            y: view.frame.height - 64 - 50,
            width: view.frame.width - 64,
            height: 50)
    }

    private func snapViews() {
        let imageTop = NSLayoutConstraint(item: deviceImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 32 + 120)
        let imageRight = NSLayoutConstraint(item: deviceImage, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -32)
        let imageLeft = NSLayoutConstraint(item: deviceImage, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 32)
        let imageHeight = NSLayoutConstraint(item: deviceImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        NSLayoutConstraint.activate([imageTop, imageRight, imageLeft, imageHeight])
        
        let nameLabelTop = NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: deviceImage, attribute: .bottom, multiplier: 1, constant: 40)
        let nameLabelRight = NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -32)
        let nameLabelLeft = NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([nameLabelTop, nameLabelRight, nameLabelLeft])

        let priceLabelTop = NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 16)
        let priceLabelRight = NSLayoutConstraint(item: priceLabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -32)
        let priceLabelLeft = NSLayoutConstraint(item: priceLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([priceLabelTop, priceLabelRight, priceLabelLeft])
    }
}
