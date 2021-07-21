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
    var generationListViewModel: GenerationListViewModel = GenerationListViewModel()
    let generationService: GenerationListService = GenerationListService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.startAnimating()
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        
        generationService.fetchGenerationList { (result, error) in
            DispatchQueue.main.async {
                loadingIndicator.stopAnimating()
                guard let result = result, error == nil else {
                    self.showAlert(title: "Failed", message: error?.localizedDescription ?? "")
                    return
                }
                
                self.generationListViewModel = result
                self.tableView?.reloadData()
            }
        }
    }
    func registerNib() {
        tableView?.register(UINib(nibName:"GenerationListTableViewCell", bundle: nil), forCellReuseIdentifier: GenerationListTableViewCellID)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let generationViewModel = generationListViewModel.itemAtIndex(index: indexPath.section)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenerationListTableViewCellID) as! GenerationListTableViewCell
        cell.configureGeneration(generationViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generationListViewModel.numberOfSectionsInTableView() ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let generationViewModel = generationListViewModel.itemAtIndex(index: indexPath.section)
        guard let pokemonSpeciesResources = generationViewModel.pokemonSpeciesResource else {
            showAlert(title: "Failed", message: "Resource Unavailable")
            return
        }
        
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.startAnimating()
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        generationService.fetchPokemonList(with: pokemonSpeciesResources) { (result) in
            DispatchQueue.main.async {
                loadingIndicator.stopAnimating()
                switch result {
                case .success(let pokemonListViewModel):
                    let pokemonListViewController = PokemonListViewController.initWithPokemonList(pokemonListViewModel: pokemonListViewModel)
                    self.navigationController?.pushViewController(pokemonListViewController, animated: true)
                    
                case .failure(let error):
                    self.showAlert(title: "Failed", message: error.localizedDescription)
                }
            }
        }
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
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertOkButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

