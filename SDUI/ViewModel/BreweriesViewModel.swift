//
//  BreweriesViewModel.swift
//  SDUI
//
//  Created by Pham Kien on 08.03.22.
//

import Foundation
import Combine
import SwiftUI



class BreweriesViewModel:ObservableObject {
    
//    private let url = URL(string:"https://api.openbrewerydb.org/breweries")
//    @Published var breweries: [Brewery] = []
//
//    private var task: AnyCancellable?
//
//
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
