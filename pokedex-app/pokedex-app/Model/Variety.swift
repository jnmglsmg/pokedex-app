//
//  Variety.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/3/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Variety: Decodable {
    let is_default: Bool
    let pokemon: Resource<Pokemon>

}
