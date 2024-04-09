//
//  Created on 2024/03/24
//

import Foundation

public enum APIError: Error {
    case networkError
    case decodeError
    case invalidRequest
    case noResponse

    public var message: String {
        switch self {
        case .networkError: return "Network Error"
        case .decodeError: return "Decode Error"
        case .invalidRequest: return "Invalid Request"
        case .noResponse: return "No Response"
        }
    }
}
