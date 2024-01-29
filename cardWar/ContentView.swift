//
//  ContentView.swift
//  cardWar
//
//  Created by Данила on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = Constants.defaultCard
    @State private var cpuCard = Constants.defaultCard
    @State private var playerScore = Constants.defaultScore
    @State private var computerScore = Constants.defaultScore
    
    var body: some View {
        ZStack {
            Image(Constants.backgroundImage)
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .frame(width: Constants.cardWidth, height: Constants.cardheight)
                    Spacer()
                    Image(cpuCard)
                        .resizable()
                        .frame(width: Constants.cardWidth, height: Constants.cardheight)
                    Spacer()
                }
                .padding(.top, Constants.topPadding)
                Spacer()
                Button(action: {
                    let playerRand = Int.random(in: Constants.minCardValue...Constants.maxCardValue)
                    let cpuRand = Int.random(in: Constants.minCardValue...Constants.maxCardValue)
                    
                    playerCard = Constants.defaultCardName + String(playerRand)
                    cpuCard = Constants.defaultCardName + String(cpuRand)
                    
                    if playerRand > cpuRand {
                        playerScore += Constants.scoreIncrement
                    } else if playerRand < cpuRand{
                        computerScore += Constants.scoreIncrement
                    }
                },
                       label: {
                    Label(Constants.playButtonLabel, systemImage: Constants.playImageSystemName)
                        .font(.title2)
                        .frame(width: Constants.labelsWidth, height: Constants.labelsHeight)
                        
                })
                .buttonStyle(.borderedProminent)
                .tint(Color.green)
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text(Constants.playerName)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, Constants.playerBottomPadding)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text(Constants.comuterName)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, Constants.playerBottomPadding)
                        Text(String(computerScore))
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
