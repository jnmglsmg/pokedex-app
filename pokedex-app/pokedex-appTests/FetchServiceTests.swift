//
//  NetworkServiceTests.swift
//  pokedex-appTests
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import XCTest
@testable import pokedex_app

class FetchServiceTests: XCTestCase {

    var generationListService : GenerationListService!
    
    override func setUp() {
        super.setUp()
        generationListService = GenerationListService()
    }
    
    override func tearDown() {
        generationListService = nil
        super.tearDown()
    }
    
    //Learn Mocks
    func testFetchGenerationList() throws {
//        generationListService.getGenerationListData { (genListResult, error) in
//            guard let genListResult = genListResult, error == nil else {
//                XCTFail()
//                return
//            }
//            XCTAssertEqual(genListResult.count, 8)
//        }
    }
    
}

