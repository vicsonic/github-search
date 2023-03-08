//
//  SearchView.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import SwiftUI

struct SearchView: View {

    @StateObject var viewModel: SearchViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.results) { result in
                    NavigationLink(value: result) {
                        Text(result.name ?? "no name")
                    }
                }
            }
            .navigationDestination(for: RepositorySearchItem.self) { result in
                DetailView(item: result)
            }
            .navigationTitle("GitHub Search")
            .listStyle(.insetGrouped)
            .searchable(text: $viewModel.query, prompt: "Search repositories")
#if DEBUG
            .onAppear {
                if GitHubSearchApp.isPreview {
                    viewModel.query = "tetris"
                }
            }
#endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(client: MockAPIClient()))
    }
}
