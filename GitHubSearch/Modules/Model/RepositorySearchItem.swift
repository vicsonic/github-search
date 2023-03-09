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
    let watchersCount: Int?
    let starsCount: Int?
    let language: String?
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
        case watchersCount = "watchers_count"
        case starsCount = "stargazers_count"
        case language
        case license
    }
}

extension RepositorySearchItem {
    enum Attribute: String, Comparable {
        static func < (lhs: RepositorySearchItem.Attribute, rhs: RepositorySearchItem.Attribute) -> Bool {
            lhs.rawValue < rhs.rawValue
        }

        case stars = "Stars Count"
        case watchers = "Watchers Count"
        case language = "Language"

        var image: String {
            let name: String
            switch self {
            case .stars:
                name = "star"
            case .watchers:
                name = "eye"
            case .language:
                name = "keyboard"
            }
            return name
        }
    }

    var attributes: [Attribute: String] {
        var att: [Attribute: String] = [:]
        if let starsCount {
            att[.stars] = "\(starsCount)"
        }
        if let watchersCount {
            att[.watchers] = "\(watchersCount)"
        }
        if let language {
            att[.language] = language
        }
        return att
    }
}
