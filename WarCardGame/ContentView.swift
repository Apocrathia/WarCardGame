//
//  ContentView.swift
//  WarCardGame
//
//  Created by Ian Young on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card4"
    @State private var cpuCard = "card5"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    // generate random number (2-14)
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    // update cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    // update score
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                    } else if playerRand == cpuRand {
                        // nothing happens, nobody wins this round.
                    }
                }, label: {
                    Image("dealbutton")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
