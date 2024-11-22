//
//  ContentView.swift
//  Dice
//
//  Created by Rodrigo Rezende on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var dice1 = 1
    @State var dice2 = 1
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                    .padding(.bottom, 100)
                diceView(dice1: dice1, dice2: dice2)
                Button(action: {
                    dice1 = Int.random(in: 1..<7)
                    dice2 = Int.random(in: 1..<7)
                }, label: {
                    ZStack {
                        Color(.clear)
                            .frame(width: 120, height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.red)
                            )
                        Text("Roll")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                    }
                })
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}

struct diceView: View {
    
    let dice1: Int
    let dice2: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 60) {
            Image("dice"+String(dice1))
            Image("dice"+String(dice2))
        }
        .padding(.bottom, 100)
    }
}
