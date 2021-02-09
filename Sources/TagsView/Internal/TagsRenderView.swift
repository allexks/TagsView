//
//  TagsRenderView.swift
//  
//
//  Created by Alexander Ignatov on 8.02.21.
//

import SwiftUI

struct TagsRenderView<DataSourceElement, Content: View>: View {
    let availableWidth: CGFloat
    let dataSource: [HashableWrapper<DataSourceElement>]
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (DataSourceElement) -> Content
    @State private var elementsSize: [Int: CGSize] = [:]
    
    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(elementMatrix, id: \.self) { elementsRow in
                HStack(spacing: spacing) {
                    ForEach(elementsRow, id: \.self) { element in
                        content(element.data)
                            .fixedSize()
                            .readSize {
                                elementsSize[element.id] = $0
                            }
                    }
                }
            }
        }
    }
    
    private var elementMatrix: [[HashableWrapper<DataSourceElement>]] {
        var rows: [[HashableWrapper<DataSourceElement>]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in dataSource {
            let elementSize = elementsSize[element.id, default: CGSize(width: availableWidth, height: 1)]
            
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
