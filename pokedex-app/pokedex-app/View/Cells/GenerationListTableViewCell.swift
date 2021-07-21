//
//  GenerationListTableViewCell.swift
//  pokedex-app
//
//  Created by OPSolutions on 6/25/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

let GenerationListTableViewCellID = "GenerationListTableViewCellID"
class GenerationListTableViewCell: UITableViewCell {

    @IBOutlet var generationLabel: UILabel?
    @IBOutlet var regionLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }

    func configureGeneration(_ generationViewModel: GenerationViewModel) {
        generationLabel?.text = generationViewModel.generation
        regionLabel?.text = generationViewModel.regionName
        
    }
}
