//
//  ViewModel.swift
//  RandomPrediction
//
//  Created by Evgeniy K on 06.06.2024.
//

import Foundation

// MARK: - View Model

@MainActor
final class ViewModel: ObservableObject {

    @Published var memes = [Prediction]()

    let provider = NetworkProvider()

    func fetchMemes() async throws {
        var fetchedMemes: [Prediction]
        fetchedMemes = try await provider.getMemes()
        memes = fetchedMemes
    }
}
