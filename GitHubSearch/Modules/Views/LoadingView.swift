//
//  LoadingView.swift
//  GitHubSearch
//
//  Created by Victor Erik Soto Martinez on 08/03/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
