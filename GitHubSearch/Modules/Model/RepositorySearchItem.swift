//
//  RepositorySearchItem.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation

struct RepositorySearchItem: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String?
    let fullName: String?
    let owner: RepositoryOwner?
    let isPrivate: Bool?
    let url: URL?
    let htmlURL: URL?
    let description: String?
    let isFork: Bool?
    let isArchived: Bool?
    let isDisabled: Bool?
    let visibility: String?
    let license: RepositoryLicense?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case isPrivate = "private"
        case url
        case htmlURL = "html_url"
        case description
        case isFork = "fork"
        case isArchived = "archived"
        case isDisabled = "disabled"
        case visibility
        case license
    }
}
