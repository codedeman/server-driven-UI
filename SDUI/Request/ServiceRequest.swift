//
//  ServiceRequest.swift
//  SDUI
//
//  Created by Pham Kien on 02.03.22.
//

import Foundation

import RxSwift
import Alamofire
let apiKey = "api_key=02e40a2424558958a9d91847362b03ae"

protocol RequestDeleagate {
    func getPopularMovies() ->Observable<MoviesResult>
    func getPopularTvShows() -> Observable<TvShowsResult>

}

class ServiceRequest:BaseRepository,RequestDeleagate {
    func getPopularTvShows() -> Observable<TvShowsResult> {
        super.createRequest(url: "https://api.themoviedb.org/3/tv/popular?\(apiKey)")
    }
    
    func getPopularMovies() -> Observable<MoviesResult> {
        return super.createRequest(url:"https://api.themoviedb.org/3/tv/popular?\(apiKey)")
    }
    
    
}
