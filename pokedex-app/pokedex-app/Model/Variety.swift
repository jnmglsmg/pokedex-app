//
//  Variety.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Variety: Codable {
    var is_default: Bool
    var pokemon: [Pokemon]
}
