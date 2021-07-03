//
//  PokemonListViewController.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

let PokemonListViewControllerID = "PokemonListViewControllerID"
class PokemonListViewController: UIViewController /*Collection View Delegate and DataSource */ {

    @IBOutlet var collectionView: UICollectionView?
    var pokemonListViewModel: [PokemonListViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: To do
    // Finalize Models first
    // Finalize Fetch Request
    // Create View Model
    // Implement UI
}
