//
//  Device.swift
//  Teset_new
//
//  Created by Alex Kolovatov on 16.10.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

struct Device {
    let name: String
    let price: Double
    var image: UIImage?
    var url: String?
    
    static func getDevices() -> [Device] {
        return [
            Device(name: "iPhone 11Pro", price: 799.00),
            Device(name: "iPhone 11ProMax", price: 1103.00),
            Device(name: "iPad", price: 1240.00),
            Device(name: "AppleTV", price: 600.00, image: #imageLiteral(resourceName: "tv")),
            Device(name: "iPad Pro", price: 1600.00, image: #imageLiteral(resourceName: "ipad")),
            Device(name: "iPad Pro Max", price: 2500.00, url: "https://www.iguides.ru/upload/medialibrary/cbc/cbc97969c9e45c6d3e67533c0f6f7aa9.png"),
            Device(name: "AppleCarPlay", price: 599.00),
            Device(name: "Apple Watch Series 4", price: 349.00),
            Device(name: "iMac 27'", price: 1899.00),
            Device(name: "iPhone XR Product RED'", price: 689.99, image: #imageLiteral(resourceName: "xr"))
        ]
    }
}
