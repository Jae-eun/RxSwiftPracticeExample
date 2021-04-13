//
//  RestaurantViewModel.swift
//  RxSwiftPracticeExample
//
//  Created by 이재은 on 2021/04/13.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
