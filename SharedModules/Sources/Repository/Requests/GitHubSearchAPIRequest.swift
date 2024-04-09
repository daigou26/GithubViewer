//
//  Created on 2024/03/03
//

import Foundation
import Model

public struct GitHubSearchAPIRequest: Request {
    public typealias ResponseType = GitHubSearchResponse

    let keyword: String

    public var url: String {
        if !keyword.isEmpty {
            return "https://api.github.com/search/repositories?q=\(keyword)"
        }
        return "https://api.github.com/search/repositories?q=swift"
    }

    public var httpMethod: String {
        return "GET"
    }

    public var headers: [String: String] {
        return [:]
    }
}
