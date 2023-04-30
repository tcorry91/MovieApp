//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController = UINavigationController()
    func start() {
        let vc = MainViewVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func goToSecondPage(data: [flightViewModelStruct]) {
        let vc = MovieDetailsVC(coordinator: self)
        vc.data4 = data
        self.navigationController.pushViewController(vc, animated: true)
    }
}
