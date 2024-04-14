import XCTest
@testable import Search
import UseCase
import Model
import Combine

final class SearchTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testSearch() throws {
        let useCase = GithubUseCaseProtocolMock()

        let githubRepositoriesData = (1...2).map {
            GitHubRepository(
                id: $0,
                name: "",
                fullName: "",
                owner: .init(id: 0, login: "", avatarUrl: URL(filePath: "")),
                htmlUrl: URL(filePath: ""),
                stargazersCount: 0
            )
        }

        useCase.searchHandler = { _ in
            return Just(githubRepositoriesData)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
        }
        let viewModel = SearchViewModel(githubUseCase: useCase)

        let expectation = XCTestExpectation()
        viewModel.search()
        viewModel.$repositories
            .dropFirst()
            .sink { repositories in
                XCTAssertEqual(repositories, githubRepositoriesData)
                XCTAssertEqual(useCase.searchCallCount, 1)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
}

extension GitHubRepository: Equatable {
    public static func == (lhs: Model.GitHubRepository, rhs: Model.GitHubRepository) -> Bool {
        lhs.id == rhs.id
    }
}
