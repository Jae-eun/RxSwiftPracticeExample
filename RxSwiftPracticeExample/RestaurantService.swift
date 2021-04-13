//
//  RestaurantService.swift
//  RxSwiftPracticeExample
//
//  Created by 이재은 on 2021/04/13.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

final class RestaurantService: RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        
        return Observable.create { observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch(let error) {
                observer.onError(error)
            }
            return Disposables.create { }
        }
    }
}

//class RestaurantService {
//
//    func fetchRestaurants() -> Observable<[Restaurant]> {
//        return Observable.create { observer -> Disposable in
//
//            let task = URLSession.shared.dataTask(with: URL(string: "url-here")!) {
//                data, _, _ in
//
//                guard let data = data else {
//                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
//                    return
//                }
//
//                do {
//                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
//                    observer.onNext(restaurants)
//                } catch(let error) {
//                    observer.onError(error)
//                }
//            }
//            task.resume()
//
//            return Disposables.create {
//                task.cancel()
//            }
//        }
//    }
//}
