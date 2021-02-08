//
//  TagsRenderView.swift
//
//
//  Created by Alexander Ignatov on 8.02.21.
//  Idea by https://fivestars.blog/swiftui/flexible-swiftui.html
//

import SwiftUI

public struct TagsView<DataSource: Collection, Content: View>: View where DataSource.Element: Hashable {
    public let dataSource: DataSource
    @State public var spacing: CGFloat = 8
    @State public var alignment: HorizontalAlignment = .leading
    public let content: (DataSource.Element) -> Content
    
    @State private var availableWidth: CGFloat = 0
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize {
                    availableWidth = $0.width
                }
            
            TagsRenderView(
                availableWidth: availableWidth,
                dataSource: dataSource,
                spacing: spacing,
                alignment: alignment,
                content: content
            )
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(dataSource: 1...88) {
            Text("Test \($0)")
        }
    }
}
