//
//  Created on 2024/02/18
//

import SwiftUI
import Combine
import Search
import UseCase
import Repository

struct ContentView: View {
    var body: some View {
        VStack {
            SearchScreen(viewModel: .init(githubUseCase: GithubUseCase(repository: GithubSearchRepository())))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
