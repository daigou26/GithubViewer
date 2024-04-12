//
//  Created on 2024/04/07
//

import SwiftUI

public struct SearchTextField: View {
    @Binding var keyword: String
    @State var isEditing = false
    @FocusState var focus: Bool
    var onCommit: (() -> Void)?

    public init(
        keyword: Binding<String>,
        onCommit: (() -> Void)? = nil
    ) {
        self._keyword = keyword
        self.onCommit = onCommit
    }

    public var body: some View {
        HStack {
            TextField(
                "keyword",
                text: $keyword,
                onEditingChanged: { changed in
                    isEditing = changed
                }, onCommit: {
                    onCommit?()
                }
            )
            .focused($focus)
            .padding(.vertical, 8)
            .padding(.horizontal, 32)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            )
            if isEditing {
                Button("Cancel") {
                    keyword = ""
                    isEditing = false
                    focus = false
                }
            }
        }
    }
}
