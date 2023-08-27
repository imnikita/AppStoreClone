//
//  APIService.swift
//  AppStore(JSON API)
//
//  Created by Nikita Popov on 15.03.2021.
//

import Foundation

class APIService {
    
    static var shared = APIService()
    
    func fetchRequest(searchTerms: String, completion: @escaping (SearchResult?, Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?term=\(searchTerms)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchNewGamesWeLove(completion: @escaping (AppGroup?, Error?) -> ()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> ()) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApps]?, Error?) -> ()){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()){
        guard let saveURL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: saveURL) { (data, responce, error) in
            if let error = error{
                print("Error in API call: ", error)
                completion(nil, error)
                return
            }
            guard let saveData = data else { return }
            do {
                let objects = try JSONDecoder().decode(T.self, from: saveData)
                completion(objects, nil)
            } catch let error {
                print("Error with JSON decoding: ", error)
                completion(nil, error)
                return
            }
        }.resume()
    }
}
