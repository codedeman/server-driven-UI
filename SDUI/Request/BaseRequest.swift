//
//  BaseRequest.swift
//  SDUI
//
//  Created by Pham Kien on 01.03.22.
//

import Foundation
import RxSwift
import Alamofire

class BaseRepository {
    func createRequest<T:Codable>(url:String) -> Observable<T> {
        let obserable = Observable<T>.create { observer ->Disposable in
            AF.request(url).validate().responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        observer.onError(response.error ?? AppError.runtimeError("random message"))
                        return
                    }
                    do {
                        let project = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(project)
                    } catch {
                        observer.onError(error)
                    }
                
                case .failure(let error):
                    observer.onError(error)
                }
               
            }
            
            return Disposables.create()
        }
        obserable.observe(on: MainScheduler.instance)
        return obserable
    }
    
    func readFileJson<T:Codable>()->Observable<T> {
        let obserable = Observable<T>.create { observer -> Disposable in
            guard let url = Bundle.main.url(forResource: "sdu", withExtension: "json") else {
                           print("Json file not found")
                return Disposables.create()
            
            }
            guard  let data = try? Data(contentsOf: url)  else {return Disposables.create()}
            
            let decoder = JSONDecoder()
            if let project = try? decoder.decode(T.self, from: data) {
                observer.onNext(project)
            }
            return Disposables.create()
        }

        obserable.observe(on: MainScheduler.instance)
        return obserable
        
        
    }
}

enum AppError: Error {
    case runtimeError(String)
}
