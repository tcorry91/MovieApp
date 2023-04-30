//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import Foundation
import Combine
import UIKit

class DataManagerGenerics {
    func apiCallGeneric<T: Codable>(url: URL, text: String) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    func apiCallNoneGeneric(url: URL) -> AnyPublisher<flightStruct, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: flightStruct.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
enum DataError:Error {
    case noDataAvailable
}
struct Constraints {
    static var urlString = "https://api.themoviedb.org/3/search/movie?api_key="
    static var apiKey = "bcbf74046a5bd0f21ff704f62139e887"
    static var urlString1 = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=")!
    static var flightURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/flight-centre-brand.appspot.com/o/developer-test-flights-list.json?alt=media&token=81d93056-9c7f-451d-94b6-3e88eb6fa9ad")!
    
}
