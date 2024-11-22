//
//  Item.swift
//  Todoey
//
//  Created by Rodrigo Rezende on 17/06/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


class Item : Codable {
    var task: String = ""
    var isDone: Bool = false
    var priority : Bool = false
}
