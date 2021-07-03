//
//  Pokemon.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/3/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Pokemon: Decodable {
    let id: Int?
    let name: String?
    let sprites: [Sprite]?
}
