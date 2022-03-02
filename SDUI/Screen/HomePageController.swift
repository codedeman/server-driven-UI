//
//  HomePageController.swift
//  SDUI
//
//  Created by Pham Kien on 02.03.22.
//
import Foundation
import RxSwift

class HomePageController:ObservableObject{
    @Published
    var uiComponents:[UIComponent] = []
    let disposableBag = DisposeBag()
    let respository:ServiceRequest = ServiceRequest()
    func loadPage() {
        uiComponents = []
        Observable.zip(respository.getPopularMovies(),respository.getPopularTvShows(),resultSelector: { (movieResult,tvShowResult)  in
            var components:[UIComponent] = []
            
            components.append(MovieListUIComponent(movieResult: MoviesResult(results:movieResult.results, title: "Kevin")))
            
            return components

        }).subscribe(
            onNext: { [weak self] components in
                self?.uiComponents = components
            },
            onError: { error in
                debugPrint(error)
            }
        ).disposed(by: disposableBag)
    }
    
    
}
