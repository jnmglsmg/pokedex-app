//
//  Generation.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Generation : Decodable {
    let id: Int
    let name: String
    let main_region: Resource<Region>
    let pokemon_species: [Resource<PokemonSpecies>]
}
