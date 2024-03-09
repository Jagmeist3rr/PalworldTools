//
//  SkillsList.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import Foundation
import SwiftUI
import UIKit

struct Skill {
    var name: String
    var rank: Int
    var description: String
    var attack: Int?
    var defense: Int?
    var movement: Int?
    var workSpeed: Int?
    var sanityDrain: Int?
    var hungerDrain: Int?
    
}



func skillList(name: String, rank: Int, description: String,
                 attack: Int, defense: Int, movement: Int,
                 workSpeed: Int, sanityDrain: Int, hungerDrain: Int) -> Skill {
    
    
    let tempSkill = Skill(name: name, rank: rank, description: description,
                          attack: attack, defense: defense, movement: movement,
                          workSpeed: workSpeed, sanityDrain: sanityDrain, hungerDrain: hungerDrain)
    
    
    return tempSkill
}

//Name,Rank,Description,Attack,Defense,Movement,
//Work,Sanity Drain, Hunger Drain,
