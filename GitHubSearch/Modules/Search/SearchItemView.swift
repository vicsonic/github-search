//
//  SearchItemView.swift
//  GitHubSearch
//
//  Created by Victor Erik Soto Martinez on 08/03/23.
//

import SwiftUI

struct SearchItemView: View {

    let item: RepositorySearchItem

    var body: some View {
        VStack(alignment: .leading) {
            if let ownerName = item.owner?.login {
                Text(ownerName)
                    .font(.caption)
            }
            if let name = item.name {
                Text(name)
                    .font(.headline)
            }
            if let description = item.description {
                Text(description)
                    .font(.subheadline)
            }
            HStack {
                ForEach(item.attributes.keys.sorted(), id:\.self) { key in
                    if let value = item.attributes[key] {
                        SearchItemValueView(image: key.image, value: value)
                            .padding(5)
                    }
                }
            }
        }
    }
}

//struct SearchItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchItemView()
//    }
//}
