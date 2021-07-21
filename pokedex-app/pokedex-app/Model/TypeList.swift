//
//  TypeList.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/8/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct TypeList: Decodable {
    let slot: Int
    let type: Resource<Type>
}
