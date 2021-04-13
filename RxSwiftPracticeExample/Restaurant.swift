//
//  Restaurant.swift
//  RxSwiftPracticeExample
//
//  Created by 이재은 on 2021/04/13.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
