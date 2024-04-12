//
//  Created on 2024/03/24
//

import Foundation
import Combine
import Model
import UseCase

public class GithubSearchRepository: GithubSearchRepositoryProtocol {
    public init() {}

    public func search(keyword: String) -> AnyPublisher<[GitHubRepository], APIError> {
        APIClient.request(GitHubSearchAPIRequest(keyword: keyword)).map {
            $0.items ?? []
        }.eraseToAnyPublisher()
    }
}
