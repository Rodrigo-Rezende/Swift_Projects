//
//  InfoView.swift
//  BusinessCard
//
//  Created by Rodrigo Rezende on 04/06/24.
//

import SwiftUI

struct InfoView: View {
    
    let infoString: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(infoString)
                .padding(3)
                .font(.custom("Arial", size: 25))
                .background(.white)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 50, height: 50)))
        }
    }
}

#Preview {
    InfoView(infoString: "Hello", imageName: "phone.fill")
        .previewLayout(.sizeThatFits)
}
