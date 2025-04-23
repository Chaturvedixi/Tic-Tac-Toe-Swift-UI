//
//  GameOverView.swift
//  Tic-Tac-Toe
//
//  Created by Anubhav Chaturvedi on 23/04/25.
//

import SwiftUI

import SwiftUI

struct GameOverView: View {
    let resultMessage: String
    let onRestart: () -> Void

    var body: some View {
        VStack(spacing: 30) {
            Text(resultMessage)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Button(action: onRestart) {
                Text("Restart Game")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}

#Preview {
    GameOverView(resultMessage: "Player X Wins") {
        print("Game restarted")
    }
}
