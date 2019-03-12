//
//  Movie.swift
//  omdbApiSEARCH
//
//  Created by Iva Cicarevic on 2/21/19.
//  Copyright © 2019 Iva Cicarevic. All rights reserved.
//

import Foundation


struct SearchMovie: Codable {
    var Search: [Movie]
    var totalResults: String
    var Response: String
}

struct Movie: Codable {
    var Title: String
    var Year: String
    var imdbID: String
    var `Type`: String
    var Poster: String?
}

