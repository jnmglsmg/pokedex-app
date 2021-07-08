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
    var pokemonListViewModel: PokemonListViewModel?

    static func initWithPokemonList(pokemonListViewModel: PokemonListViewModel) -> PokemonListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: PokemonListViewControllerID) as PokemonListViewController
        
        viewController.pokemonListViewModel = pokemonListViewModel
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: To do
    // Finalize Models first
    // Finalize Fetch Request
    // Create View Model
    // Implement UI
}
