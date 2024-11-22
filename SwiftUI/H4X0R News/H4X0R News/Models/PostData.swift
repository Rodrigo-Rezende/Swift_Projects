//
//  PostData.swift
//  H4X0R News
//
//  Created by Rodrigo Rezende on 06/06/24.
//

import Foundation

struct PostData: Decodable {
    let hits : [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID : String
    let points : Int
    let title : String
    let url : String?
}
