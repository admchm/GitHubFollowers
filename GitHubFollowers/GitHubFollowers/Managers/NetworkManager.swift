//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 21/03/2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}

    func getFollower(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {    // returning [Follower] or error as String
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, ErrorMessage.invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, ErrorMessage.unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, ErrorMessage.invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, ErrorMessage.invalidData)
                return
            }
            
            do {
                // decoder - takes the data from the server, and it's decoding data into object
                // encoder - takes the object and it is encoding it into data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // (type: Decodable.Protocol) means that we need to pass something that conforms to the Decodable Protocol.
                // In this case it will be Follower (Follower.self, because we need to use a type here)
                let followers = try decoder.decode([Follower].self, from: data)
                
                completed(followers, nil)
                
            } catch {
                completed(nil, ErrorMessage.invalidData)
            }
        }
        
        task.resume()
    }
}
