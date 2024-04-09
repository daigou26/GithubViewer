//
//  Created on 2024/02/18
//

import SwiftUI
import Combine
import Search
import Repository

struct ContentView: View {
    var body: some View {
        VStack {
            SearchScreen(viewModel: .init(githubUseCase: .init(repository: GithubSearchRepository())))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
