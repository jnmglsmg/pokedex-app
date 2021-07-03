//
//  Region.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Region : Decodable {
    let id: Int?
    let name: String?
    let pokedexes: [Resource<Pokedex>]?
}
