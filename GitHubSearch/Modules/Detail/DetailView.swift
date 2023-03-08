//
//  DetailView.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import SwiftUI

struct DetailView: View {
    let item: RepositorySearchItem
    
    var body: some View {
        Text(item.name ?? "no name")
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(result: SearchResult.mock)
//    }
//}
