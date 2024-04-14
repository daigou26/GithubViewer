//
//  Created on 2024/03/02
//

import Foundation

public struct GitHubRepositoryOwner: Codable {
    public let id: Int
    public let login: String
    public let avatarUrl: URL

    public init(id: Int, login: String, avatarUrl: URL) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
