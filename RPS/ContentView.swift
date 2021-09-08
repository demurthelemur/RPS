//
//  ContentView.swift
//  RPS
//
//  Created by Demir Dereli on 8.09.2021.
//

import SwiftUI

struct ContentView: View {
    let mooves = ["Rock", "Paper", "Scissors"]
    let emojisForMooves = ["🪨", "📜", "✂️"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var objective = Bool.random()
    @State private var playersChoice = " "
    
    @State private var playerScore = 0
    
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                VStack(spacing: 50){
                    Spacer()
                    Text("Rock Paper Scissors")
                        .foregroundColor(.blue)
                        .font(.system(size: 40))
                        .fontWeight(.medium)
                    VStack(spacing: 10){
                        Text("The AI's choice: \(mooves[currentChoice])")
                            .foregroundColor(.blue)
                            .font(.title)
                            .fontWeight(.medium)
                        Text("\(emojisForMooves[currentChoice])")
                            .font(.system(size: 70))
                        Text("Objective: \(objective ? "Win" : "Loose" )")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .fontWeight(.medium)
                        HStack(spacing: 15){
                            ForEach(0 ..< 3){ number in
                                Button(action: {
                                    playersChoice = mooves[number]
                                    game(playersChoice)
                                }){
                                    Text("\(emojisForMooves[number])")
                                        .font(.system(size: 70))
                                        .clipShape(Capsule())
                                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                }
                            }
                        }
                        Text("Score: \(playerScore)")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .fontWeight(.medium)
                        Spacer()
                    }
                }
            }
    }
    func game(_ playersChoice: String){
        let AIChoice = mooves[currentChoice]
        if AIChoice == "Rock"{
            if objective{
                if playersChoice == "Paper"{
                    playerScore+=1
                }
            } else{
                if playersChoice == "Scissors"{
                    playerScore += 1
                }
            }
        }
        else if AIChoice == "Paper"{
            if objective{
                if playersChoice == "Scissors"{
                    playerScore+=1
                }
            } else{
                if playersChoice == "Rock"{
                    playerScore += 1
                }
            }
        }
        else if AIChoice == "Scissors"{
            if objective{
                if playersChoice == "Rock"{
                    playerScore+=1
                }
            } else{
                if playersChoice == "Paper"{
                    playerScore += 1
                }
            }
        }
        currentChoice = Int.random(in: 0...2)
        objective = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
