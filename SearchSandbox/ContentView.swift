//
//  Created on 2024/04/15
//

import SwiftUI
import Search

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    SearchScreen(viewModel: .init(githubUseCase: GithubUseCaseMock()))
                        .padding()
                } label: {
                    Text("検索画面")
                }
            }
        }
    }
}

import Combine
import UseCase
import Model
class GithubUseCaseMock: GithubUseCaseProtocol {
    func search(keyword: String) -> AnyPublisher<[Model.GitHubRepository], Model.APIError> {
        let githubRepositoriesData = (1...2).map {
            GitHubRepository(
                id: $0,
                name: "Repository\($0)\(keyword)",
                fullName: "Repository\($0)",
                owner: .init(id: 0, login: "owner", avatarUrl: URL(string: "https://picsum.photos/200")!),
                htmlUrl: URL(filePath: ""),
                stargazersCount: $0
            )
        }
        return Just(githubRepositoriesData)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
}

#Preview {
    ContentView()
}
