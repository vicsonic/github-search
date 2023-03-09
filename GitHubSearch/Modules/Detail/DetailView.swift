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
        VStack(alignment: .leading) {
            if let ownerName = item.owner?.login {
                RepositoryOwnerView(name: ownerName,
                                    url: item.owner?.avatarURL,
                                    size: 35)
                .padding(5)
            }
            if let description = item.description {
                Text(description)
                    .font(.subheadline)
                    .padding(5)
            }
            if let url = item.htmlURL ?? item.url {
                Link(url.absoluteString, destination: url)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(5)
            }
            HStack {
                ForEach(item.attributes.keys.sorted(), id:\.self) { key in
                    if let value = item.attributes[key] {
                        SearchItemValueView(image: key.image, value: value)
                            .padding(5)
                    }
                }
            }
            Spacer()
        }
        .navigationTitle(item.name ?? "Search Result")
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(result: SearchResult.mock)
//    }
//}
