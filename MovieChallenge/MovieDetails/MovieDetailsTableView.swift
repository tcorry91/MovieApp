//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//


import Foundation
import UIKit

extension MovieDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var info = data4[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: mainViewCellID, for: indexPath) as! MovieDetailsCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.myBackgroundColor
        cell.data = info
        if let imageToUse = info.posterPathFinal {
            cell.MovieImage.loadImageUsingCacheWithUrlString(imageToUse)
        }
        if let imageToUse = info.backDropPathFinal {
            cell.BackGroundMovieImage.loadImageUsingCacheWithUrlString(imageToUse)
            print("imagetouse", imageToUse)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data4.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
