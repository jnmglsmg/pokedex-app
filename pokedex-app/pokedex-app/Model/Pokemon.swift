//
//  Pokemon.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Pokemon: Codable {
    var id: Int
    var name: String
    var height: Int
    var weight: Int
    var sprites: [Sprites]
    //stats
    var types: [Type]
    
    //create did set
    var url: String
}
