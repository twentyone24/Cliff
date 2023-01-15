//
//  TextView.swift
//  CliffApp
//
//  Created by NAVEEN MADHAN on 4/2/22.
//

import SwiftUI

struct CliffTextView: View {
    @Environment(\.colorScheme) private var colorScheme

    let title: String
    @Binding var text: String
    var onEditingChanged: ((Bool) -> Void)?

    var keyboardType: UIKeyboardType = .default

    var body: some View {
        ZStack {
            Capsule(style: .continuous)
                .foregroundColor(colorScheme == .light ? Color(#colorLiteral(red: 0.9395676295, green: 0.9395676295, blue: 0.9395676295, alpha: 1)) : Color(#colorLiteral(red: 0.2293992357, green: 0.2293992357, blue: 0.2293992357, alpha: 1)))
                .frame(height: 50)
            
                TextField(title, text: $text, onEditingChanged: onEditingChanged ?? { _ in })
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(keyboardType)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: 400)
    }
}


