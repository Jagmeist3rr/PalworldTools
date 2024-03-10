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
    var rank: Image
    var description: String?
    var attack: Int?
    var defense: Int?
    var movement: Int?
    var workSpeed: Int?
    var sanityDrain: Int?
    var hungerDrain: Int?
    
}



func skillList(name: String, rank: Image, description: String,
                 attack: Int, defense: Int, movement: Int,
                 workSpeed: Int, sanityDrain: Int, hungerDrain: Int) -> Skill {
    
    
    let tempSkill = Skill(name: name, rank: rank, description: description,
                          attack: attack, defense: defense, movement: movement,
                          workSpeed: workSpeed, sanityDrain: sanityDrain, hungerDrain: hungerDrain)
    
    
    return tempSkill
}

class SkillsManager: ObservableObject {
    @Published var palSkills: [Skill] = [
        Skill(name: "Artisan", rank: Image("R1pos"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: 50, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Work Slave", rank: Image("R1pos"), description: nil, attack: -30, defense: nil, movement: nil, workSpeed: 30, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Serious", rank: Image("R2pos"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: 20, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lucky", rank: Image("R3pos"), description: nil, attack: 15, defense: nil, movement: nil, workSpeed: 15, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Conceited", rank: Image("R1pos"), description: nil, attack: nil, defense: -10, movement: nil, workSpeed: 10, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Hooligan", rank: Image("R1pos"), description: nil, attack: 15, defense: nil, movement: nil, workSpeed: -10, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Clumsy", rank: Image("R1neg"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: -10, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Slacker", rank: Image("R3neg"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: -30, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Musclehead", rank: Image("R2pos"), description: nil, attack: 30, defense: nil, movement: nil, workSpeed: -50, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Celestial Emperor", rank: Image("R3pos"), description: "Raises Neutral Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Divine Dragon", rank: Image("R3pos"), description: "Raises Dragon Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Earth Emperor", rank: Image("R3pos"), description: "Raises Ground Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Ferocious", rank: Image("R3pos"), description: nil, attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Flame Emperor", rank: Image("R3pos"), description: "Raises Fire Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Ice Emperor", rank: Image("R3pos"), description: "Raises Ice Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Legend", rank: Image("R3pos"), description: "Legendary Skill", attack: 20, defense: 20, movement: 15, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lord of Darkness", rank: Image("R3pos"), description: "Raises Dark Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lord of Lightning", rank: Image("R3pos"), description: "Raises Eletric Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lord of the Sea", rank: Image("R3pos"), description: "Raises Water Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Spirit Emperor", rank: Image("R3pos"), description: "Raises Grass Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Sadist", rank: Image("R1pos"), description: nil, attack: 15, defense: -15, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Aggressive", rank: Image("R1pos"), description: nil, attack: 10, defense: -10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Blood of the Dragon", rank: Image("R1pos"), description: "Raise Dragon Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Brave", rank: Image("R1pos"), description: nil, attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Capacitor", rank: Image("R1pos"), description: "Raises Electic Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Coldblooded", rank: Image("R1pos"), description: "Raises Ice Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Fragant Foilage", rank: Image("R1pos"), description: "Raises Grass Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Hydromaniac", rank: Image("R1pos"), description: "Raises Water Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Power of Gaia", rank: Image("R1pos"), description: "Raises Grass Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Pyromanic", rank: Image("R1pos"), description: "Raises Fire Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Stronghold Strategist", rank: Image("R3pos"), description: "Raises Player Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Vanguard", rank: Image("R3pos"), description: "Raises Player Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Veil of Darkness", rank: Image("R1pos"), description: "Raises Dark Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Zen Mind", rank: 1, description: "Raises Neutral Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Coward", rank: -1, description: nil, attack: -10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Masochist", rank: 1, description: nil, attack: -15, defense: 15, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Pacifist", rank: -3, description: nil, attack: -20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Burly Body", rank: 3, description: nil, attack: nil, defense: 20, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Abnormal", rank: 1, description: "Raises Neutral Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Brittle", rank: -3, description: nil, attack: nil, defense: -20, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Botanical Barrier", rank: 1, description: "Raises Grass Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil)
    ]
}
//Name,Rank,Description,Attack,Defense,Movement,
//Work,Sanity Drain, Hunger Drain,
