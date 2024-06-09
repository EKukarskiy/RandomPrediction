//
//  ContentView.swift
//  RandomPrediction
//
//  Created by Evgeniy K on 05.06.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ViewModel()
    @State private var question: String = ""
    @State private var showMeme = false
    @State private var currentMemeURL: String?

    enum Constants {
        static let verticalSpacing: CGFloat = 20
        static let imageCornerRadius: CGFloat = 20
        static let imageShadowRadius: Double = 6
        static let imageHeight: CGFloat = 300
        static let contentPadding: CGFloat = 20
    }

    var body: some View {

        NavigationStack {
            VStack(spacing: Constants.verticalSpacing) {

                TextField("Ask a question", text: $question)
                // Custom input style here:
                    .inputStyle()

                if !showMeme {
                    if !question.isEmpty {
                        CustomButton(text: "Ask") {
                            Task {
                                do {
                                    try await viewModel.fetchMemes()
                                    currentMemeURL = viewModel.memes.randomElement()?.url
                                    showMeme = true
                                } catch {
                                    print("Error fetching memes: \(error)")
                                }
                            }
                        }
                    }

                } else {
                    if let url = currentMemeURL {
                        AsyncImage(url: URL(string: url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: Constants.imageCornerRadius))
                        .shadow(radius: Constants.imageShadowRadius)
                        .frame(height: Constants.imageHeight)
                        .padding()

                        CustomButton(text: "Answer accepted") {
                            showMeme = false
                            question = ""
                        }

                        CustomButton(text: "Send a new meme") {
                            currentMemeURL = viewModel.memes.randomElement()?.url
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Meme Prediction")
            .padding(Constants.contentPadding)
        }
        .ignoresSafeArea()
        .dynamicTypeSize(.xSmall ... .xxLarge)
    }
}

#Preview {
    ContentView()
}
