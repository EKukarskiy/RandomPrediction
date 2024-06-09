//
//  CustomButton.swift
//  RandomPrediction
//
//  Created by Evgeniy K on 08.06.2024.
//

import SwiftUI

// MARK: - Button Style

struct CustomButton: View {
    
    var text = "Ask"
    var action = {}

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title).bold()
                .foregroundStyle(.white)
                .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(Color.pink)
        .foregroundStyle(.primary)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

#Preview {
    CustomButton()
}
