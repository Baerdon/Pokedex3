//
//  DetailViewController.swift
//  Pokedex3
//
//  Created by Jaroslav Bažant on 04.10.17.
//  Copyright © 2017 DewDrops. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heigthLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        let image = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = image
        currentEvoImg.image = image
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
    }
    
    func updateUI() {
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heigthLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let nextEvoString = "Next Evolution: " + pokemon.nextEvolutionName + " LVL " + pokemon.nextEvolutionLevel
            evoLbl.text = nextEvoString
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
