//
//  RepositoryOwner.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation

struct RepositoryOwner: Decodable, Hashable {
    let id: Int
    let login: String?
    let url: URL?
    let type: String?
    let avatarURL: URL?

    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case url
        case type
        case avatarURL = "avatar_url"
    }
}
