//
//  Pokemon.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Pokemon {
    let name : String
    let url : String
    let order : Int
    let sprites : Sprite
    let type : [Type]
    let weight : Int
    let height : Int
}
