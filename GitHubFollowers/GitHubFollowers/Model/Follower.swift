//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 21/03/2023.
//

import Foundation

struct Follower: Codable, Hashable {      // variables must match the data structure
                                          // but I can wrote avatar_url as camelCase
    var login: String
    var avatarUrl: String
}
