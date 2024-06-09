//
//  NetworkProvider.swift
//  RandomPrediction
//
//  Created by Evgeniy K on 06.06.2024.
//

import Foundation

// MARK: - Network Layer

actor NetworkProvider {
    func getMemes() async throws -> [Prediction] {
        var memes = [Prediction]()

        guard let url = URL(string: "https://api.imgflip.com/get_memes") else {
            throw MemeError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw MemeError.invalidResponse
        }

        guard let decodedMemes = try? JSONDecoder().decode(Query.self, from: data) else {
            throw MemeError.decodingError
        }

        memes = decodedMemes.data.memes
        return memes
    }
}

// MARK: - Errors

enum MemeError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
