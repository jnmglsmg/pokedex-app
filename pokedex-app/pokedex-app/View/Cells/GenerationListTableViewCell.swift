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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setGenerationTitle(generationTitle: String, regionName: String) {
        self.generationLabel?.text = generationTitle
        self.regionLabel?.text = regionName
    }
    
}
