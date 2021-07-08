//
//  PokemonSpecies.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/3/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonSpecies: Decodable {
    let name: String?
    let order: Int?
    let id: Int?
    let is_legendary: Bool?
    let varieties: [Variety]?
}
