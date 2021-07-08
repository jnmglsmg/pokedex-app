//
//  GenerationListViewModel.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct GenerationListViewModel {
    var generationViewModelList: [GenerationViewModel]?

    init(generationList: [GenerationViewModel]) {
        generationViewModelList = generationList
    }
    
    func itemAtIndex(index: Int) -> GenerationViewModel? {
        guard let generationViewModelList = generationViewModelList else {
            return nil
        }
        return generationViewModelList[index]
    }
    
    func numberOfSectionsInTableView() -> Int {
        guard let generationViewModelList = generationViewModelList else {
            return 0
        }
        
        return generationViewModelList.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return 1
    }
}

struct GenerationViewModel {
    var generation: String?
    var regionName: String?
    var regionResource: Resource<Region>?
    var pokemonSpeciesResource: [Resource<PokemonSpecies>]?
    
    init(generation: Generation) {
        self.generation = generation.name?.uppercased() ?? ""
        self.regionName = generation.main_region?.name?.capitalized ?? ""
        self.regionResource = generation.main_region
        self.pokemonSpeciesResource = generation.pokemon_species
    }
}
