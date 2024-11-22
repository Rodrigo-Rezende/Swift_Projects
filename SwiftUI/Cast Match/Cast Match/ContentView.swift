//
//  ContentView.swift
//  Cast Match
//
//  Created by Rodrigo Rezende on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 25)
                .padding(.all, 25)
                .foregroundStyle(.orange)
            VStack(alignment: .leading){
                Image("rodrigo")
                    .resizable()
                    .clipShape(.rect(cornerRadius: 25))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 380, height: 400)
                    .padding(.top, 10)
                    .shadow(color: .black, radius: 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 5)
                            
                    }
                HStack {
                    VStack(alignment: .leading ,spacing: 10) {
                        Text("Nome Completo")
                            .foregroundStyle(.black)
                            .bold()
                            .fontWidth(.expanded)
                        Text("Ocupacao")
                            .foregroundStyle(.black)
                            .bold()
                            .fontWidth(.expanded)
                        Text("contato@email.com")
                            .foregroundStyle(.black)
                            .bold()
                    }
                    .padding(.leading, 25)
                }
                    
            }
            .padding(.all, 25)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
