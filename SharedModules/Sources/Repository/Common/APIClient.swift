//
//  Created on 2024/03/03
//

import Foundation
import Combine
import Model

public struct APIClient {
    public init() {}

    public static func request<T, U>(_ request: T) -> AnyPublisher<U, APIError> where T: Request, U: Codable, T.ResponseType == U {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: request.urlRequest)
            .tryMap { element -> Data in
                guard (element.response as? HTTPURLResponse) != nil else {
                    throw APIError.noResponse
                }

                return element.data
            }
            .decode(type: U.self, decoder: jsonDecoder)
            .mapError { error -> APIError in
                if let error = error as? DecodingError {
                    return APIError.decodeError
                } else {
                    return APIError.networkError
                }
            }
            .eraseToAnyPublisher()
    }
}
