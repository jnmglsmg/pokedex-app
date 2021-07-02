//
//  GenerationList.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct GenerationList : Codable {
    let count : Int
    let result : Resource<[Generation]>
}
