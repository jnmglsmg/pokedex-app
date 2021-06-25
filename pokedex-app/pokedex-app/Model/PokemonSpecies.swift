//
//  PokemonSpecies.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonSpecies: Codable {
    var id: String
    var name: String
    var order: Int
    var varieties: [Variety]
    //Create did set
    var url: String
}
