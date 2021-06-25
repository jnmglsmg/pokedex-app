//
//  GenerationListTests.swift
//  pokedex-appTests
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import XCTest
@testable import pokedex_app

class GenerationListTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testGenerationListViewModel() {
        let region = Region(name: "Kanto", pokedexes: [])
        let generation = Generation(name: "Generation-I", url: nil, main_region: region)
        let generationViewModel = GenerationListViewModel(generation: generation)
        
        XCTAssertEqual(generationViewModel.name, "Generation-I")
        XCTAssertEqual(generationViewModel.region, "Kanto")
    }

}
