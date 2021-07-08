//
//  GenerationListService.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/21/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class GenerationListService: NSObject {
    
    func fetchGenerationList(completion: @escaping(_ generationListViewModel: GenerationListViewModel?, _ error: Error?) -> Void) {
        let rootUrlString = "https://pokeapi.co/api/v2/generation/"
        let baseGeneration = Resource<GenerationList>(name: "Root URL", url: rootUrlString)
        
        //1st API Call
        //load root url
        NetworkService.shared.loadResource(resource: baseGeneration) { result in
            switch result {
            case .success(let generationList):
                guard let generationResourceList = generationList.results else {
                    return
                }
                
                //2nd Chain of API Call
                //completion block for each generation resource
                self.fetchGenerationItems(generationResourceList: generationResourceList) { (result, error) in
                    guard let result = result, error == nil else {
                        completion(nil, error)
                        return
                    }
                    let generationListViewModel = GenerationListViewModel(generationList: result)
                    DispatchQueue.main.async {
                        completion(generationListViewModel, nil)
                    }
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchGenerationItems(generationResourceList: [Resource<Generation>], completion: @escaping(_ generation: [GenerationViewModel]?,_ error: Error?) -> Void) {
        
        var generationViewModelList: [GenerationViewModel] = []
        //load each resources from generationList.result: [Resource<Generation>]
        let group = DispatchGroup()
        for generationResource in generationResourceList {
            group.enter()
            NetworkService.shared.loadResource(resource: generationResource) { result in
                switch result {
                case .success(let generation):
                    //Result to View Model
                    let generationViewModel = GenerationViewModel(generation: generation)
                    generationViewModelList.append(generationViewModel)
                    
                case .failure(let error):
                    completion(nil, error)
                }
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.global()) {
            print("Complete")
            completion(generationViewModelList, nil)
        }
    }

    func fetchPokemonList(with resources: [Resource<PokemonSpecies>] , completion: @escaping(Result<PokemonListViewModel, NetworkError>) -> Void) {
        var pokemonViewModelList: [PokemonViewModel] = []
        
        //API Chain 1
        fetchPokemonSpecies(with: resources) { (pokemonSpeciesResult) in
            let group = DispatchGroup()
            
            switch pokemonSpeciesResult {
            case .success(let pokemonSpeciesList):
                for pokemonSpecies in pokemonSpeciesList {
                
                    group.enter()
                    let variety = pokemonSpecies.varieties?.first
                    if let pokemonResource = variety?.pokemon {
                        
                        //API Chain 2
                        self.fetchPokemonDetails(with: pokemonResource) { (pokemonResult) in
                            
                            switch pokemonResult {
                            case .success(let pokemon):
                                let pokemonViewModel = PokemonViewModel(name: pokemon.name,
                                                                        image_url: pokemon.sprites?.other?.official_artwork?.front_default,
                                                                        type: pokemon.types,
                                                                        id: pokemon.id,
                                                                        isLegendary: pokemonSpecies.is_legendary, order: pokemonSpecies.order)
                                pokemonViewModelList.append(pokemonViewModel)
                                
                            case .failure(let error):
                                completion(.failure(error))
                            }
                            
                            group.leave()
                        }
                    }
                }
            case .failure(let error):
                print("Failed")
                completion(.failure(error))
            }
            group.notify(queue: DispatchQueue.global()) {
                print("Final API Complete")
                let pokemonListViewModel = PokemonListViewModel(pokemonList: pokemonViewModelList)
                completion(.success(pokemonListViewModel))
            }
        }
    }
    
    //MARK: Fetch Pokemon Details Methods
    func fetchPokemonSpecies(with resources: [Resource<PokemonSpecies>], completion: @escaping(Result<[PokemonSpecies], NetworkError>) -> Void) {
        
        var pokemonSpeciesList: [PokemonSpecies] = []
        let group = DispatchGroup()
        
        for resource in resources {
            group.enter()
            NetworkService.shared.loadResource(resource: resource) { result in
                switch result {
                case .success(let pokemonSpecies):
                    print("Success")
                    pokemonSpeciesList.append(pokemonSpecies)
                case .failure(let error):
                    print("Failed")
                    completion(.failure(error))
                }
                group.leave()
            }
        }
        group.notify(queue: DispatchQueue.global()) {
            print("Pokemon Species API Complete")
            completion(.success(pokemonSpeciesList))
        }
    }
    
    func fetchPokemonDetails(with resource: Resource<Pokemon>, completion: @escaping(Result<Pokemon, NetworkError>) -> Void) {
        NetworkService.shared.loadResource(resource: resource) { (result) in
            switch result {
            case .success(let pokemon):
                print("Success")
                completion(.success(pokemon))
            case .failure(let error):
                print("Failure")
                completion(.failure(error))
            }
        }
    }
}


