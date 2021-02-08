//
//  TagsRenderView.swift
//  
//
//  Created by Alexander Ignatov on 8.02.21.
//

import SwiftUI

struct TagsRenderView<DataSource: Collection, Content: View>: View where DataSource.Element: Hashable {
    let availableWidth: CGFloat
    let dataSource: DataSource
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (DataSource.Element) -> Content
    @State private var elementsSize: [DataSource.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(elementMatrix, id: \.self) { elementsRow in
                HStack(spacing: spacing) {
                    ForEach(elementsRow, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize {
                                elementsSize[element] = $0
                            }
                    }
                }
            }
        }
    }
    
    private var elementMatrix: [[DataSource.Element]] {
        var rows: [[DataSource.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in dataSource {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }
        
        return rows
    }
}
