//
//  ContentView.swift
//  cardWar
//
//  Created by Данила on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card2"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .frame(width: 156, height: 222)
                    Spacer()
                    Image(cpuCard)
                        .resizable()
                        .frame(width: 156, height: 222)
                    Spacer()
                }
                .padding(.top, 130.0)
                Spacer()
                Button(action: {
                    let playerRand = Int.random(in: 2...13)
                    let cpuRand = Int.random(in: 2...13)
                    
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if playerRand < cpuRand{
                        cpuScore += 1
                    }
                },
                       label: {
                    Label("Play", systemImage: "play")
                        .font(.title2)
                        .frame(width: 130, height: 40)
                        
                })
                .buttonStyle(.borderedProminent)
                .tint(Color.green)
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
