//
//  SocialApp.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 23.03.2021.
//

import Foundation


struct SocialApps: Decodable {
    let id, name, imageUrl, tagline: String
}
