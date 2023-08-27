//
//  AppGroup.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 21.03.2021.
//

import Foundation


struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let id: String
}
