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
    func getProduct() -> Observable<ProductModel>

}

class ServiceRequest:BaseRepository,RequestDeleagate {
    func getProduct() -> Observable<ProductModel> {
        return super.createRequest(url: "https://codedeman.github.io/ssd_api/sdu.json")
    }
    
    
    func getPopularTvShows() -> Observable<TvShowsResult> {
        return super.createRequest(url: "https://api.themoviedb.org/3/tv/popular?\(apiKey)")
//        return super.readFileJson()
    }
    
    func getPopularMovies() -> Observable<MoviesResult> {
        return super.createRequest(url: "https://api.themoviedb.org/3/movie/popular?\(apiKey)")
    }
    
    
}
