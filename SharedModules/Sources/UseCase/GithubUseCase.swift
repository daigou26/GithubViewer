//
//  Created on 2024/04/07
//

import Foundation
import Combine
import Model

public protocol GithubUseCaseProtocol {
    func search(keyword: String) -> AnyPublisher<[GitHubRepository], APIError>
}

public class GithubUseCase: GithubUseCaseProtocol {
    let repository: GithubSearchRepositoryProtocol

    public init(repository: GithubSearchRepositoryProtocol) {
        self.repository = repository
    }

    public func search(keyword: String) -> AnyPublisher<[GitHubRepository], APIError> {
        repository.search(keyword: keyword)
    }
}
