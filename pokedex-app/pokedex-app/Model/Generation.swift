//
//  Generation.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct Generation : Codable {
    var id: String?
    var name : String?
    var main_region : Resource<Region>?
}
