//
//  RepositoryLicense.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation

struct RepositoryLicense: Decodable, Hashable {
    let key: String?
    let name: String?
    let url: URL?
}
