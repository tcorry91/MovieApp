//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import Foundation
import UIKit

extension MovieDetailsVC {
    func setUpTableViewDetails() {
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.layer.zPosition = 15
        tableView.register(MovieDetailsCell.self, forCellReuseIdentifier: mainViewCellID)
    }
    func setUpTableView() {
        self.view.addSubview(self.tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 3).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -3).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
