//
//  MessageHeaderView.swift
//  GitHubSearch
//
//  Created by Victor Erik Soto Martinez on 09/03/23.
//

import SwiftUI

struct MessageHeaderView: View {
    let message: String

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text(message)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
    }
}

struct MessageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MessageHeaderView(message: "No results")
    }
}
