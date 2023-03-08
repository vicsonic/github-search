//
//  RequestPerforming.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import Foundation
import Combine

protocol RequestPerforming {
    func perform<T: Decodable>(url: URL,
                               method: HTTPMethod,
                               headers: [String: String]?,
                               auth: APIAuth?) -> AnyPublisher<T, Error>
}

final class URLSessionRequestPerformer: RequestPerforming {
    func perform<T>(url: URL,
                    method: HTTPMethod = .get,
                    headers: [String: String]? = nil,
                    auth: APIAuth? = nil) -> AnyPublisher<T, Error> where T : Decodable {
        var request: URLRequest = .init(url: url)
        request.httpMethod = method.rawValue
        var allHeaders = headers
        if let auth {
            switch auth {
            case .bearer(let token):
                allHeaders?["Bearer"] = token
            }
        }
        request.allHTTPHeaderFields = allHeaders
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
