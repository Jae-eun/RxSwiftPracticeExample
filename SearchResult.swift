//
//  SearchResult.swift
//  RxSwiftPracticeExample
//
//  Created by 이재은 on 2021/04/20.
//

import Foundation

// MARK: - SearchResult
struct SearchResults: Codable {
    let resultCount: Int
    let results: [iTunesResult]
}

// MARK: - iTunesResult
struct iTunesResult: Codable {
    let wrapperType: String
    let kind: String
    let artistID, collectionID, trackID: Int
    let artistName: String
    let collectionName, trackName: String
    let trackViewURL: String
    let previewURL: String
    let artworkUrl60, artworkUrl100: String
    let releaseDate: Date
    let isStreamable: Bool

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl60, artworkUrl100, releaseDate, isStreamable
    }
}
