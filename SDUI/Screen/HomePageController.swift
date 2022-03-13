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
        Observable.zip(respository.getPopularMovies(),respository.getPopularTvShows(),respository.getProduct(), resultSelector: { (movieModel,tvShowModel,productModel)  in
            var components:[UIComponent] = []
            components.append(NewHeaderUIComponent(product: productModel))

            components.append(MovieListUIComponent.init(movieResult: movieModel))

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
