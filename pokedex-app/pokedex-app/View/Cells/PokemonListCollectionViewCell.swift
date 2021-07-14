//
//  PokemonListCollectionViewCell.swift
//  pokedex-app
//
//  Created by OPSolutions on 7/8/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

enum PokemonType : String {
    case Normal = "normal"
    case Fighting = "fighting"
    case Flying = "flying"
    case Poison = "poison"
    case Ground = "ground"
    case Rock = "rock"
    case Bug = "bug"
    case Ghost = "ghost"
    case Steel = "steel"
    case Fire = "fire"
    case Water = "water"
    case Grass = "grass"
    case Electric = "electric"
    case Psychic = "psychic"
    case Ice = "ice"
    case Dragon = "dragon"
    case Dark = "dark"
}

let PokemonListCollectionViewCellID = "PokemonListCollectionViewCellID"
class PokemonListCollectionViewCell: UICollectionViewCell {

    @IBOutlet var containerView: UIView?
    @IBOutlet var pokemonImageView: URLImageView?
    @IBOutlet var pokemonName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellFormat()
    }
    
    func configurePokemonDetails(_ pokemonViewModel: PokemonViewModel) {
        pokemonName?.text = pokemonViewModel.name
        pokemonImageView?.loadImageWithUrl(url: pokemonViewModel.image_url)
    }
    
    func configureCellFormat() {
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }

//    func setBackgroundColorWithType(type: String) {

//        switch type {
//        case PokemonType.Normal.rawValue:
//        case PokemonType.Fighting.rawValue:
//        case PokemonType.Flying.rawValue:
//        case PokemonType.Poison.rawValue:
//        case PokemonType.Ground.rawValue:
//        case PokemonType.Rock.rawValue:
//        case PokemonType.Bug.rawValue:
//        case PokemonType.Ghost.rawValue:
//        case PokemonType.Steel.rawValue:
//        case PokemonType.Fire.rawValue:
//        case PokemonType.Water.rawValue:
//        case PokemonType.Grass.rawValue:
//        case PokemonType.Electric.rawValue:
//        case PokemonType.Psychic.rawValue:
//            break
//        case PokemonType.Ice.rawValue:
//        case PokemonType.Dragon.rawValue:
//            break
//        case PokemonType.Dark.rawValue:
//            break
//        default:
//        }
//    }
}
