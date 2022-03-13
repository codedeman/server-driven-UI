//
//  ProductFetchable.swift
//  SDUI
//
//  Created by Pham Kien on 12.03.22.
//

import Foundation
import Combine

protocol ProductFetchable {
    
    
    func fetchRequest()
}

final class ProductService {
    
    
    func fetchRepo()->AnyPublisher<Repo,Error> {
        let url = URL(string: "https://api.github.com/repos/itsmeichigo/Playgrounds")!

        return URLSession.shared.dataTaskPublisher(for: url).map {$0.data}.decode(type: Repo.self, decoder: JSONDecoder()).receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    func fetchProduct()->AnyPublisher<[Brewery],Error> {
        
         let url = URL(string:"https://api.openbrewerydb.org/breweries")!

        return URLSession.shared.dataTaskPublisher(for: url).map {$0.data}.decode(type: [Brewery].self, decoder: JSONDecoder()).receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
}
