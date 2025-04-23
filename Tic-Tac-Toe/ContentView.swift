//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Anubhav Chaturvedi on 23/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var board = Array(repeating: "", count: 9)
    @State private var currentPlayer = true
    @State private var gameOver = false
    @State private var resultMessage = ""

    let winPatterns: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
        [0, 4, 8], [2, 4, 6]             // Diagonals
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Current Player: \(currentPlayer ? "X" : "O")")
                .font(.title2)
                .bold()

            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                ForEach(0..<9) { index in
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 100, height: 100)
                           
                        Text(board[index])
                            .font(.system(size: 48))
                            .bold()
                    }
                    .onTapGesture {
                        if board[index] == "" && !gameOver {
                            board[index] = currentPlayer ? "X" : "O"
                            checkWin()
                            currentPlayer.toggle()
                        }
                    }
                }
            }

           
        }
        .padding()
        .sheet(isPresented: $gameOver) {
            GameOverView(resultMessage: resultMessage) {
                board = Array(repeating: "", count: 9)
                currentPlayer = true
                gameOver = false
                resultMessage = ""
            }
        }
        
    }

    func checkWin() {
        for pattern in winPatterns {
            let marks = pattern.map { board[$0] }
            if marks.allSatisfy({ $0 == "X" }) {
                resultMessage = "Player X wins!"
                gameOver = true
                return
            } else if marks.allSatisfy({ $0 == "O" }) {
                resultMessage = "Player O wins!"
                gameOver = true
                return
            }
        }

        if !board.contains("") {
            resultMessage = "It's a draw!"
            gameOver = true
        }
    }
}
#Preview {
    ContentView()
}
