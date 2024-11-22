//
//  DetailView.swift
//  H4X0R News
//
//  Created by Rodrigo Rezende on 06/06/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}



