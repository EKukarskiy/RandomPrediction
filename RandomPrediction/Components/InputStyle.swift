//
//  InputStyle.swift
//  RandomPrediction
//
//  Created by Evgeniy K on 07.06.2024.
//

import SwiftUI

// MARK: - Text Field Modifier

struct InputStyle: ViewModifier {
    
    var icon: String
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 40)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(
                Image(systemName: icon)
                    .foregroundStyle(.secondary)
                    .frame(width: 36, height: 36)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
            )
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke())
            .opacity(0.6)
    }
}

extension View {
    func inputStyle(icon: String = "questionmark") -> some View {
        modifier(InputStyle(icon: icon))
    }
}
