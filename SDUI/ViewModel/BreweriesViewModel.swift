//
//  BreweriesViewModel.swift
//  SDUI
//
//  Created by Pham Kien on 08.03.22.
//

import Foundation
import Combine
import SwiftUI
struct Repo: Decodable {
    let name: String
    let description: String?
    let language: String?
}

class BreweriesViewModel:ObservableObject {
    
    
//    private let url = URL(string:"https://api.openbrewerydb.org/breweries")
    @Published var breweries: [Brewery] = []
    @Published var repoDetail: Repo?


    private var task: AnyCancellable?

    
    func  fetchBreweries () {
        
        task = ProductService().fetchProduct().sink(receiveCompletion: { completion in
            
        }, receiveValue: { berry in
            self.breweries = berry
            print("berry=====\(berry.count)")
        })
//        task = URLSession.shared.dataTaskPublisher(for: url!)
//                    .map { $0.data }
//                    .decode(type: [Brewery].self, decoder: JSONDecoder())
//                    .replaceError(with: [])
//                    .eraseToAnyPublisher()
//                    .receive(on: RunLoop.main)
//                    .assign(to: \BreweriesViewModel.breweries, on: self)
    }
    
    
    func fetchRepos() {
        
        task = ProductService().fetchRepo().sink(receiveCompletion: { completion in
            
            
        }, receiveValue: { repo in
            self.repoDetail = repo
        })
//        let url = URL(string: "https://api.github.com/users/itsmeichigo/repos")!

//        func fetchRepoDetail() {
//            let url = URL(string: "https://api.github.com/repos/itsmeichigo/Playgrounds")!
//                    URLSession.shared.dataTaskPublisher(for: url)
//                        .tryMap(\.data)
//                        .decode(type: Repo?.self, decoder: JSONDecoder())
//                        .replaceError(with: nil)
//                        .receive(on: RunLoop.main)
//                        .assign(to: &$repoDetail)
//        }
        
    }


//    func fetchBrewries() {
//
//        guard let apiUrl = url else {return}
//
//        URLSession.shared.dataTask(with: URLRequest(url: apiUrl)) { data, response, error in
//
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode([Brewery].self, from: data!)
//                self.breweries = decodedResponse
//            } catch {
//            }
//
//        }.resume()
//    }
}
