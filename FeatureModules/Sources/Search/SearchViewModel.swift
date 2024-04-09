//
//  Created on 2024/04/07
//

import Foundation
import SwiftUI
import UseCase
import Model
import Combine

public class SearchViewModel: ObservableObject {
    @Published var repositories = [GitHubRepository]()
    @Published var keyword = ""
    @Published var isLoading = false
    @Published var isShownErrorAlert = false
    @Published var errorMessage = ""
    var cancellables = Set<AnyCancellable>()

    let githubUseCase: GithubUseCase
    public init(githubUseCase: GithubUseCase) {
        self.githubUseCase = githubUseCase
    }

    func search() {
        isLoading = true
        githubUseCase.search(keyword: keyword)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.errorMessage = error.message
                    self?.isShownErrorAlert = true
                }
            } receiveValue: { [weak self] res in
                self?.repositories = res
            }
            .store(in: &cancellables)

    }
}
