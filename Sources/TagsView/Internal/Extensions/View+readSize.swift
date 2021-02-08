//
//  View+readSize.swift
//  
//
//  Created by Alexander Ignatov on 8.02.21.
//

import SwiftUI

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        ).onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

fileprivate struct SizePreferenceKey: PreferenceKey {
    
  static var defaultValue: CGSize = .zero
    
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
    
}
