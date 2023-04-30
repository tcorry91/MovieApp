//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import Foundation
import Combine

struct Transform {
    func refactorAndInsertIntoViewModel(data: flightStruct) -> Future <[flightViewModelStruct], AsyncError> {
        var array = [flightViewModelStruct]()
        var d = DateFormatter()
        data.results?.forEach {
            var title = "".ifLet(s: $0.title)
            var averageVote = "".makeStringBetween(s: "".sDoubleToString(d: $0.voteAverage), A: 0, B: 2)
            var isAdult = false.ifLetBool(s: $0.adult)
            isAdult.toggle()
            var language = "".ifLet(s: $0.originalLanguage)
            var overView = "".ifLet(s: $0.overview)
            var posterPathAdd = "https://image.tmdb.org/t/p/w500"
            var posterPathTest = "".ifLet(s: $0.posterPath)
            var posterPathFinal = posterPathAdd + posterPathTest
            var BackDropPath = "".ifLet(s: $0.backdropPath)
            var BackDropFinal = posterPathAdd + BackDropPath
            var releaseDate = "".sReFormatDate(s: "".ifLet(s: $0.releaseDate), form1: d.format(s: "yyyy-MM-dd"), form2: d.format(s: "dd MMMM yyyy"))
            
            var input = flightViewModelStruct(MovieTitle: title, rating: averageVote, Adult: isAdult, OriginalLanguage: language, Description: overView, posterPathFinal: posterPathFinal, backDropPathFinal: BackDropFinal, releasedDate: releaseDate)
            array.append(input)
        }
        return Future() { promise in
            array.count < 1 ? promise(Result.failure(AsyncError.message("Re fail"))) : promise(Result.success(array)); array.removeAll()
        }
    }
}
