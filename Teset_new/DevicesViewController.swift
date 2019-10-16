//
//  DevicesViewController.swift
//  Teset_new
//
//  Created by ragnaros on 25.06.2019.
//  Copyright © 2019 ragnaros. All rights reserved.
//

import UIKit

class DevicesViewController: UIViewController {
    
    private let deviceCellIdentifier: String = "deviceCellIdentifier"
    private var devices = Device.getDevices()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(DeviceTableViewCell.self, forCellReuseIdentifier: deviceCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        view.addSubview(tableView)
        title = "Apple Devices"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height)
        
        // tableView.frame = view.bounds
    }
    
}

// MARK: - UITableViewDataSource
extension DevicesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: deviceCellIdentifier, for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }
        cell.configure(devices[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DevicesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController()
        detailVC.configure(devices[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
