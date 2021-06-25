//
//  PokemonSpeciesUrl.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonEntry: Codable {
    var entry_number: Int
    var pokemon_species: [PokemonSpecies]
}
