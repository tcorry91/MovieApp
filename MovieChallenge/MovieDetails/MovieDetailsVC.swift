//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import UIKit
import Combine

class MovieDetailsVC: UIViewController {
    var data3 = [flightViewModelStruct]()
    var data4 = [flightViewModelStruct]()
    private var usersSubscriper: AnyCancellable?
    var tableView = tableCustom()
    let mainViewCellID = "mainViewCellID"
    var mainCor: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.mainCor = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUpTableViewDetails()
        setUpTableView()
    }
}
