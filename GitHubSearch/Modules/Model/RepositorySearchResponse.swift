//
//  RepositorySearchResponse.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation

struct RepositorySearchResponse: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [RepositorySearchItem]

    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
