//
//  GenerationListService.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/21/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class GenerationListService: NSObject {
    
    func fetchRootGeneration(completion: @escaping(_ generationListViewModel: GenerationListViewModel?, _ error: Error?) -> Void) {
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
                    group.leave()
                    
                case .failure(let error):
                    group.leave()
                    completion(nil, error)
                }
            }
        }
        
        group.notify(queue: DispatchQueue.global()) {
            print("Complete")
            completion(generationViewModelList, nil)
        }
    }
}


