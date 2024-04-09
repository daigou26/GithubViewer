//
//  Created on 2024/03/02
//

import Foundation

public protocol Request {
    associatedtype ResponseType

    var url: String { get }
    var httpMethod: String { get }
    var headers: [String: String] { get }
}

extension Request {
    var urlRequest: URLRequest {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
