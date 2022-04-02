//
//  PickerEnumView.swift
//  CliffApp
//
//  Created by NAVEEN MADHAN on 4/2/22.
//

import Foundation
import SwiftUI

public struct EnumPicker<L, T>: View
where
L: View,
T: CaseIterable & CustomStringConvertible & Hashable,
T.AllCases: RandomAccessCollection,
T.AllCases.Index == Int {
    @Binding private var selection: T
    private let label: L
    
    public init(selection: Binding<T>, label: L) {
        self._selection = selection
        self.label = label
    }
    @Environment(\.colorScheme) private var colorScheme
    
    public var body: some View {
        ZStack {
            Capsule(style: .continuous)
                .foregroundColor(colorScheme == .light ? Color(#colorLiteral(red: 0.9395676295, green: 0.9395676295, blue: 0.9395676295, alpha: 1)) : Color(#colorLiteral(red: 0.2293992357, green: 0.2293992357, blue: 0.2293992357, alpha: 1)))
                .frame(height: 50)
            Picker(selection: $selection, label: label) {
                ForEach(0..<T.allCases.count) {
                    Text(T.allCases[$0].description).tag(T.allCases[$0])
                }
            }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: 400)
    }
}
