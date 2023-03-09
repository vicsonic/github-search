//
//  SearchItemValueView.swift
//  GitHubSearch
//
//  Created by Victor Erik Soto Martinez on 08/03/23.
//

import SwiftUI

struct SearchItemValueView: View {
    let image: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 15)
            Text(value)
                .font(.footnote)
        }
    }
}

//struct SearchItemValueView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchItemValueView()
//    }
//}
