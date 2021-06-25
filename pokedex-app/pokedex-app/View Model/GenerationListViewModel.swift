//
//  GenerationListViewModel.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct GenerationListViewModel {
    var name: String
    var region: String

    init(generation: Generation) {
        self.name = generation.name ?? ""
        self.region = generation.main_region.name
    }
}
