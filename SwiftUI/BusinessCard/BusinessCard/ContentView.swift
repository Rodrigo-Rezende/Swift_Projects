//
//  ContentView.swift
//  BusinessCard
//
//  Created by Rodrigo Rezende on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemMint)
                .ignoresSafeArea(.all)
            VStack {
                Image("rodrigo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(lineWidth: 3))
                    .padding(.bottom)
                Text("Rodrigo Mendes Rezende")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                Text("Computer Engineer")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                InfoView(infoString: "+55 53 981101999", imageName: "phone.fill")
                    .padding(.bottom)
                InfoView(infoString: "digomrezende@gmail.com", imageName: "mail.fill")
                    
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}


