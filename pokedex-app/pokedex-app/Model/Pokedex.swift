//
//  Pokedex.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class Pokedex: Codable {
    var id: Int
    var pokemon_entries: [PokemonSpecies]
    var name: String
    var url: String {
        didSet {
            NetworkService.shared.executeFetchRequest(with: url) { (data, error) -> Void in
                guard let data = data else {
                    print("Failed to fetch Pokedex")
                    return
                }
                
                if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
                {
                    do {
                        let result: Pokedex = try JSONDecoder().decode(Pokedex.self, from: jsonData)
                        self.pokemon_entries = result.pokemon_entries
                    } catch {
                        print("ERROR:", error)
                    }
                }
            }
        }
    }
}
