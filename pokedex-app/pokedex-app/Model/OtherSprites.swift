//
//  OtherSprites.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/3/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct OtherSprites: Decodable {
    //Coding Keys
    let official_artwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case official_artwork = "official-artwork"
    }
}

