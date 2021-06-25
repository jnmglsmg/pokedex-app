//
//  Pokedex.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Pokedexes: Codable{
    var id: Int
    var pokedexes: [Pokedex]
    var url: String
    var name: String
    //create didset
}
