//
//  APIResource.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation

enum APIConstants {
    static let baseURL: String = "https://api.github.com"
    static let headers: [String: String] = [
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28"
    ]
}

protocol APIResource {
    var baseURL: String { get }
    var path: String? { get }
    var queryItems: [URLQueryItem] { get set }

    var url: URL? { get }
}

extension APIResource {
    var baseURL: String {
        APIConstants.baseURL
    }

    var url: URL? {
        guard var components: URLComponents = .init(string: baseURL) else { return nil }
        if let path {
            components.path = path
        }
        components.queryItems = queryItems
        return components.url
    }
}

struct SearchRepositoriesAPIResource: APIResource {
    var path: String? {
        "/search/repositories"
    }

    var queryItems: [URLQueryItem]
}

struct MockAPIResource: APIResource {
    var baseURL: String = ""
    var path: String? = nil
    var queryItems: [URLQueryItem] = []

    var url: URL? {
        Bundle.main.url(forResource: "results", withExtension: "json")
    }
}
