//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation
import Combine

protocol SearchViewModeling {
    var query: String { get set }
    var isSearching: Bool { get set }
    var results: [RepositorySearchItem] { get set }
    var client: APIClient { get set}
}

final class SearchViewModel: SearchViewModeling, ObservableObject {
    @Published var query: String = ""
    @Published var isSearching: Bool = false {
        didSet {
            isEmpty = results.isEmpty && !query.isEmpty && !isSearching
        }
    }
    @Published var isEmpty: Bool = false
    @Published var results: [RepositorySearchItem] = []

    var client: APIClient

    private var cancellables = Set<AnyCancellable>()

    init(client: APIClient) {
        self.client = client
        $query
            // Adjust throttling to fulfill the API rate limit
            // Not the best experience, but we are limited by the key
            // Ref: https://docs.github.com/en/rest/search?apiVersion=2022-11-28#rate-limit
            .throttle(for: 2.01, scheduler: DispatchQueue.main, latest: true)
            .removeDuplicates()
            .map { query -> AnyPublisher<[RepositorySearchItem]?, Never> in
                self.isSearching = true
                return self.client.searchRepositories(query: query)
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { results in
                defer { self.isSearching = false }
                guard let results else {
                    return
                }
                self.results = results
            })
            .store(in: &cancellables)
    }
}
