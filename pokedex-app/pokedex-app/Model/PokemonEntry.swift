//
//  PokemonEntry.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/3/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonEntry: Decodable {
    let entry_number: Int?
    let pokemon_species: Resource<PokemonSpecies>?
}
