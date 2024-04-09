//
//  Created on 2024/04/07
//

import Foundation
import Combine
import Model

public protocol GithubSearchRepositoryProtocol {
    func search(keyword: String) -> AnyPublisher<[GitHubRepository], APIError>
}
