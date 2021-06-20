//
//  ViewController.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/20/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let generationList = NetworkService.baseUrl + "generation/"
        NetworkService.shared.executeFetchRequest(with: generationList)
    }


}

