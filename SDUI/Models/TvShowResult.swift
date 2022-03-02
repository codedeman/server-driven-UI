//
//  TvShowResult.swift
//  SDUI
//
//  Created by Pham Kien on 02.03.22.
//

import Foundation
struct TvShowsResult: Codable {
    var results: [TvShow]
    var title: String?
}

struct TvShow: Codable {
    var id: CLong
    var name: String
    var overview: String
    var poster_path: String
}
