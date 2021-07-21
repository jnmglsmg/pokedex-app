//
//  PokemonListViewController.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

let PokemonListViewControllerID = "PokemonListViewControllerID"
class PokemonListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView?
    var pokemonListViewModel: PokemonListViewModel = PokemonListViewModel()

    static func initWithPokemonList(pokemonListViewModel: PokemonListViewModel) -> PokemonListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: PokemonListViewControllerID) as PokemonListViewController
        
        viewController.pokemonListViewModel = pokemonListViewModel
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    func registerNib() {
        collectionView?.register(UINib(nibName: "PokemonListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PokemonListCollectionViewCellID)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pokemonListViewModel.numberOfSectionsInCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonListViewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemonViewModel = pokemonListViewModel.itemAtIndex(index: indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCellID, for: indexPath) as! PokemonListCollectionViewCell
        cell.configurePokemonDetails(pokemonViewModel)
        return cell
        //types
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: view.frame.size.width / 2 - 20, height: 150)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var pokemonViewModel = pokemonListViewModel.itemAtIndex(index: indexPath.row)
        
        pokemonViewModel.name = "something"
        collectionView.reloadData()
    }
}
