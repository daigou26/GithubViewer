//
//  Created on 2024/04/07
//

import Foundation
import SwiftUI
import Model
import Component

public struct SearchScreen: View {
    @StateObject public var viewModel: SearchViewModel

    public init(viewModel: SearchViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        viewModel.search()
    }

    public var body: some View {
        ZStack {
            VStack(spacing: 20) {
                SearchTextField(keyword: $viewModel.keyword) {
                    viewModel.search()
                }

                ScrollView {
                    LazyVStack {
                        ForEach(Array(viewModel.repositories.enumerated()), id: \.offset) { _, repository in
                            card(repository: repository)
                        }
                    }
                }
            }
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.isShownErrorAlert) {
            Button {
                viewModel.isShownErrorAlert = false
            } label: {
                Text("OK")
            }

        }
    }

    func card(repository: GitHubRepository) -> some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: repository.owner.avatarUrl) { response in
                    response.image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Text("\(repository.owner.login)/\(repository.name)")
                    .font(.body.bold())
                Spacer()
            }
            Text(repository.description ?? "")
            HStack {
                if let lang = repository.language {
                    Text(lang + "・")
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                }
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(Color.gray)
                Text(String(repository.stargazersCount))
                    .font(.caption)
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(20)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        }
        .padding(.bottom, 14)
    }
}
