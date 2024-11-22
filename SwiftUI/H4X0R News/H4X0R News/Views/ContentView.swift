//
//  ContentView.swift
//  H4X0R News
//
//  Created by Rodrigo Rezende on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = Network()
    
    var body: some View {
        NavigationStack{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("H4XOR News")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}

