//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}
protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
