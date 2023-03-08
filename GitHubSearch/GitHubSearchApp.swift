//
//  GitHubSearchApp.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import SwiftUI

@main
struct GitHubSearchApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel(client: GitHubAPIClient()))
        }
    }
}
