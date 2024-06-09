//
//  Prediction.swift
//  RandomPrediction
//
//  Created by Evgeniy K on 05.06.2024.
//

import Foundation

// MARK: - JSON Model

struct Prediction: Decodable, Identifiable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
    let captions: Int
}

struct Memes: Decodable {
    let memes: [Prediction]
}

struct Query: Decodable {
    let success: Bool
    let data: Memes
}

// MARK: - Preview Data
extension Prediction {
    static func testPrediction() -> Prediction {
        let prediction = Prediction(id: "80707627", name: "Sad Pablo Escobar", url: "https://i.imgflip.com/1c1uej.jpg", width: 720, height: 709, box_count: 3, captions: 198750)
        return prediction
    }
}
