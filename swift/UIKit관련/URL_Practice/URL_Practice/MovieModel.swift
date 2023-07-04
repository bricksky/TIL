//
//  MovieModel.swift
//  URL_Practice
//
//  Created by 김동현 on 2023/07/04.
//

import Foundation


struct MovieModel: Decodable {
    let resultCount: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let artworkUrl100: String
}
