//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//


import Foundation
import UIKit

extension MainViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var info = data0[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: mainViewCellID, for: indexPath) as! MainViewCell
            cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.data = info
        var hide = info.Adult
        cell.AdultWarining.isHidden = hide
        if info.posterPathFinal == "" {
            cell.MovieImage.image = UIImage(systemName: "photo")
        }
        if let imageToUse = info.posterPathFinal {
            cell.MovieImage.loadImageUsingCacheWithUrlString(imageToUse)
        }
            return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data0.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = data0[indexPath.row]
        self.mainCor.goToSecondPage(data: [data])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
