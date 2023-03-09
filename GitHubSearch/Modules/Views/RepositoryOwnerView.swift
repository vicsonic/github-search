//
//  RepositoryOwnerView.swift
//  GitHubSearch
//
//  Created by Victor Erik Soto Martinez on 08/03/23.
//

import SwiftUI

struct RepositoryOwnerView: View {
    let name: String
    let url: URL?
    let size: CGFloat

    var body: some View {
        HStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: size)
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: size)
            }
            .clipShape(Circle())
            Text(name)
                .font(.caption)
        }
    }
}

//struct RepositoryOwnerView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepositoryOwnerView()
//    }
//}
