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
    
    var generationViewModel: GenerationListViewModel? {
        didSet {
            guard let generationViewModel = generationViewModel else {
                return
            }
            generationLabel?.text = generationViewModel.name
            regionLabel?.text = generationViewModel.region
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
