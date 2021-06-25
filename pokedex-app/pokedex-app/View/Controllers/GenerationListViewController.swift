//
//  ViewController.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class GenerationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView?
    var generationList: [GenerationListViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        initializeDummyGenerationList()
    }
    
    fileprivate func initializeDummyGenerationList() {
        let region1 = Region(name: "Kanto", pokedexes: [])
        let generation1 = Generation(name: "Generation-I", url: nil, main_region: region1)
        let generationViewModel1 = GenerationListViewModel(generation: generation1)
        
        let region2 = Region(name: "Kanto", pokedexes: [])
        let generation2 = Generation(name: "Generation-II", url: nil, main_region: region2)
        let generationViewModel2 = GenerationListViewModel(generation: generation2)
        
        let region3 = Region(name: "Kanto", pokedexes: [])
        let generation3 = Generation(name: "Generation-III", url: nil, main_region: region3)
        let generationViewModel3 = GenerationListViewModel(generation: generation3)
        
        let region4 = Region(name: "Kanto", pokedexes: [])
        let generation4 = Generation(name: "Generation-IV", url: nil, main_region: region4)
        let generationViewModel4 = GenerationListViewModel(generation: generation4)
        
        generationList.append(generationViewModel1)
        generationList.append(generationViewModel2)
        generationList.append(generationViewModel3)
        generationList.append(generationViewModel4)
    }
    
    func registerNib() {
        tableView?.register(UINib(nibName:"GenerationListTableViewCell", bundle: nil), forCellReuseIdentifier: GenerationListTableViewCellID)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenerationListTableViewCellID) as! GenerationListTableViewCell
        cell.generationViewModel = generationList[indexPath.section]
        cell.layer.cornerRadius = 5
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generationList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let pokemonListViewController = self.storyboard?.instantiateViewController(identifier: PokemonListViewControllerID)
        self.navigationController?.pushViewController(pokemonListViewController!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        return headerView
    }
}

