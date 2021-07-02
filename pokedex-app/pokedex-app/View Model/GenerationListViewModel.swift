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

    init(generationList: GenerationList) {
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
    
    init(generation: Generation) {
        self.generation = generation.name ?? ""
        self.regionName = generation.main_region?.name ?? ""
    }
}
