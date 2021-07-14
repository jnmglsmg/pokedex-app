//
//  PokemonListViewModel.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct PokemonListViewModel {
    var pokemonViewModelList: [PokemonViewModel]
    
    init() {
        self.pokemonViewModelList = []
    }
    
    init(pokemonList: [PokemonViewModel]) {
        self.pokemonViewModelList = pokemonList.sorted(by: { $0.order < $1.order})
    }
}

struct PokemonViewModel {
    
    private var pokemonModel: Pokemon
    private var pokemonSpeciesModel: PokemonSpecies
    
    var id: Int {
        get {
            return pokemonModel.id
        }
    }
    var name: String {
        set {
            pokemonModel.name = newValue
        }
        get {
            return pokemonModel.name.capitalized
        }
    }
    var image_url: String {
        return pokemonModel.sprites.other.official_artwork.front_default
    }
    var types: [String] {
        //            //Use Map
        var typeStrings: [String] = []
        for type in pokemonModel.types {
            typeStrings.append(type.type.name)
        }
        return typeStrings

    }
    var is_legendary: Bool {
        return pokemonSpeciesModel.is_legendary
    }
    var order: Int {
        return pokemonSpeciesModel.order
    }
    
    
    init(pokemonSpecies: PokemonSpecies, pokemon: Pokemon) {
        pokemonModel = pokemon
        pokemonSpeciesModel = pokemonSpecies
        
//        id = pokemon.id
//        name = pokemon.name
//        order = pokemonSpecies.order ?? 0
//        image_url = pokemon.sprites?.other?.official_artwork?.front_default
//        is_legendary = pokemonSpecies.is_legendary
//
    }
//
//    init(name: String?, image_url: String?, typeList: [TypeList]?, id: Int?, isLegendary: Bool?, order: Int?) {
//        self.name = name?.capitalized ?? ""
//        self.image_url = image_url ?? ""
//        self.id = id ?? nil
//        self.is_legendary = isLegendary ?? false
//        self.order = order ?? 0
//
//
//    }
}

extension PokemonListViewModel {
    
    func getItemWithId(id:Int) -> PokemonViewModel? {
        return pokemonViewModelList.filter({ $0.id == id }).first ?? nil
    }
    
    func itemAtIndex(index: Int) -> PokemonViewModel {
        return self.pokemonViewModelList[index]
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return self.pokemonViewModelList.count
    }
    
    func numberOfSectionsInCollectionView() -> Int {
        return 1
    }
}


