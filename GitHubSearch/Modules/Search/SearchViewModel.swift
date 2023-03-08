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
    @Published var isSearching: Bool = false
    @Published var results: [RepositorySearchItem] = []

    var client: APIClient

    private var cancellables = Set<AnyCancellable>()

    init(client: APIClient) {
        self.client = client
        $query
            .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .removeDuplicates()
            .map { query -> AnyPublisher<[RepositorySearchItem], Never> in
                self.isSearching = true
                return self.client.searchRepositories(query: query)
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { results in
                self.results = results
                self.isSearching = false
            })
            .store(in: &cancellables)
    }
}
