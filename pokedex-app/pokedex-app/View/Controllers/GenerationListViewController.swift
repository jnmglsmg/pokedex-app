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
    var generationListViewModel: GenerationListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    func registerNib() {
        tableView?.register(UINib(nibName:"GenerationListTableViewCell", bundle: nil), forCellReuseIdentifier: GenerationListTableViewCellID)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let generationViewModel = generationListViewModel?.itemAtIndex(index: indexPath.section) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenerationListTableViewCellID) as! GenerationListTableViewCell
        cell.setGenerationTitle(generationTitle: generationViewModel.generation ?? "", regionName: generationViewModel.regionName ?? "")
        cell.layer.cornerRadius = 5
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generationListViewModel?.numberOfSectionsInTableView() ?? 0
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

