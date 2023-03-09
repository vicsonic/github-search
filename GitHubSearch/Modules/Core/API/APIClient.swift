//
//  APIClient.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation
import Combine

enum APIAuth {
    case bearer(token: String)
}

protocol APIClient {
    func searchRepositories(query: String) -> AnyPublisher<[RepositorySearchItem]?, Never>
}

fileprivate extension APIClient {
    func searchRepositories(resource: APIResource,
                            method: HTTPMethod = .get,
                            headers:[String: String]? = [:],
                            auth: APIAuth? = nil) -> AnyPublisher<[RepositorySearchItem]?, Never> {
        guard let url = resource.url else {
            return Just([]).eraseToAnyPublisher()
        }
        let publisher: AnyPublisher<RepositorySearchResponse, Error> =
        URLSessionRequestPerformer().perform(url: url, method: method, headers: headers, auth: auth)
        return publisher
            .map { $0.items }
            .catch { _ in return Just(nil) }
            .eraseToAnyPublisher()
    }
}

final class GitHubAPIClient: APIClient {
    func searchRepositories(query: String) -> AnyPublisher<[RepositorySearchItem]?, Never> {
        guard !query.isEmpty else { return Just([]).eraseToAnyPublisher() }
        let resource: SearchRepositoriesAPIResource = .init(queryItems: [
            .init(name: "q", value: query)
        ])
        return searchRepositories(resource: resource,
                                  headers: APIConstants.headers,
                                  auth: .bearer(token: GitHubSearchKeys.Global().gitHubToken))
    }
}

final class MockAPIClient: APIClient {
    func searchRepositories(query: String) -> AnyPublisher<[RepositorySearchItem]?, Never> {
        guard !query.isEmpty else { return Just(nil).eraseToAnyPublisher() }
        return searchRepositories(resource: MockAPIResource())
    }
}
