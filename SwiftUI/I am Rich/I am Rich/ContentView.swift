//
//  ContentView.swift
//  I am Rich
//
//  Created by Rodrigo Rezende on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea(.all)
            VStack {
                Text("I am Rich")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
