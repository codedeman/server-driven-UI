//
//  MoviesResult.swift
//  SDUI
//
//  Created by Pham Kien on 02.03.22.
//

import Foundation

struct MoviesResult: Codable {
    var results: [Movie]
    let title: String?
}


struct Movie: Codable, Hashable {
    var id: CLong
    var title: String
    var overview: String
    var poster_path: String
}
