//
//  PokemonListViewModel.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonListViewModel {
    let pokemonViewModelList: [PokemonViewModel]
    
    init(pokemonList: [PokemonViewModel]) {
        self.pokemonViewModelList = pokemonList
    }
}

struct PokemonViewModel {
    let id: Int?
    var name: String?
    var image_url: String?
    var types: [Resource<Type>]?
    var is_legendary: Bool?
    let order: Int?
    
    init() {
        self.id = nil
        self.name = ""
        self.image_url = ""
        self.types = []
        self.is_legendary = false
        self.order = nil
    }
    
    init(name: String?, image_url: String?, type: [Resource<Type>]?, id: Int?, isLegendary: Bool?, order: Int?) {
        self.name = name ?? ""
        self.image_url = image_url ?? ""
        self.types = type ?? []
        self.id = id ?? nil
        self.is_legendary = isLegendary ?? false
        self.order = order ?? nil
    }
}

extension PokemonListViewModel {
    
    func getItem(with id:Int) -> PokemonViewModel? {
        return pokemonViewModelList.filter({ $0.id == id }).first ?? nil
    }
    
    func itemAtIndex(index: Int) -> PokemonViewModel {
        return self.pokemonViewModelList[index]
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInCollectionView() -> Int {
        return 1
    }
}


