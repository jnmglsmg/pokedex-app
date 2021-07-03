//
//  PokemonListViewModel.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonListViewModel {
    var name: String
    var image_url: String
    var color: String
    
    init(name: String, image_url: String, color: String) {
        self.name = name
        self.image_url = image_url
        self.color = color // change to type maybe
    }
}
