//
//  Created on 2024/03/02
//

import Foundation

public struct GitHubRepository: Codable {
    public let id: Int
    public let name: String
    public let fullName: String
    public let owner: GitHubRepositoryOwner
    public let htmlUrl: URL
    public let description: String?
    public let language: String?
    public let stargazersCount: Int

    public init(
        id: Int,
        name: String,
        fullName: String,
        owner: GitHubRepositoryOwner,
        htmlUrl: URL,
        description: String? = nil,
        language: String? = nil,
        stargazersCount: Int
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.htmlUrl = htmlUrl
        self.description = description
        self.language = language
        self.stargazersCount = stargazersCount
    }
}
