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
        Skill(name: "Celestial Emperor", rank: Image("R3pos"), description: "Neutral Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Divine Dragon", rank: Image("R3pos"), description: "Dragon Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Earth Emperor", rank: Image("R3pos"), description: "Ground Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Ferocious", rank: Image("R3pos"), description: nil, attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Flame Emperor", rank: Image("R3pos"), description: "Fire Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Ice Emperor", rank: Image("R3pos"), description: "Ice Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Legend", rank: Image("R3pos"), description: "Legendary Skill", attack: 20, defense: 20, movement: 15, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lord of Darkness", rank: Image("R3pos"), description: "Dark Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lord of Lightning", rank: Image("R3pos"), description: "Eletric Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Lord of the Sea", rank: Image("R3pos"), description: "Water Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Spirit Emperor", rank: Image("R3pos"), description: "Grass Attack", attack: 20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Sadist", rank: Image("R1pos"), description: nil, attack: 15, defense: -15, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Aggressive", rank: Image("R1pos"), description: nil, attack: 10, defense: -10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Blood of the Dragon", rank: Image("R1pos"), description: "Dragon Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Brave", rank: Image("R1pos"), description: nil, attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Capacitor", rank: Image("R1pos"), description: "Electic Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Coldblooded", rank: Image("R1pos"), description: "Ice Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Fragant Foilage", rank: Image("R1pos"), description: "Raises Grass Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Hydromaniac", rank: Image("R1pos"), description: "Water Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Power of Gaia", rank: Image("R1pos"), description: "Grass Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Pyromanic", rank: Image("R1pos"), description: "Fire Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Stronghold Strategist", rank: Image("R3pos"), description: "Player Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Vanguard", rank: Image("R3pos"), description: "Player Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Veil of Darkness", rank: Image("R1pos"), description: "Dark Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Zen Mind", rank: Image("R1pos"), description: "Neutral Attack", attack: 10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Coward", rank: Image("R1neg"), description: nil, attack: -10, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Masochist", rank: Image("R1pos"), description: nil, attack: -15, defense: 15, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Pacifist", rank: Image("R3neg"), description: nil, attack: -20, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Burly Body", rank: Image("R3pos"), description: nil, attack: nil, defense: 20, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Abnormal", rank: Image("R1pos"), description: "Neutral Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Brittle", rank: Image("R3neg"), description: nil, attack: nil, defense: -20, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Botanical Barrier", rank: Image("R1pos"), description: "Grass Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Bottomless Stomach", rank: Image("R2neg"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: 15, hungerDrain: nil),
        Skill(name: "Cheery", rank: Image("R1pos"), description: "Dark Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Dainty Eater", rank: Image("R1pos"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: -10, hungerDrain: nil),
        Skill(name: "Diet Lover", rank: Image("R3pos"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: -15),
        Skill(name: "Destructive", rank: Image("R2neg"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: 15, hungerDrain: nil),
        Skill(name: "Downtrodden", rank: Image("R1neg"), description: nil, attack: nil, defense: -10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Dragonkiller", rank: Image("R1pos"), description: "Dragon Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Earthquake Resistance", rank: Image("R1pos"), description: "Ground Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Glutton", rank: Image("R1neg"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: 10, hungerDrain: nil),
        Skill(name: "Hard Skin", rank: Image("R1pos"), description: nil, attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Heated Body", rank: Image("R1pos"), description: "Ice Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Insulated Body", rank: Image("R1pos"), description: "Electric Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Logging Foreman", rank: Image("R3pos"), description: "Player Logging", attack: nil, defense: nil, movement: nil, workSpeed: 25, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Mine Foreman", rank: Image("R3pos"), description: "Player Mining", attack: nil, defense: nil, movement: nil, workSpeed: 25, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Motivational Leader", rank: Image("R3pos"), description: "Player Work Speed", attack: nil, defense: nil, movement: nil, workSpeed: 25, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Nimble", rank: Image("R1pos"), description: nil, attack: nil, defense: nil, movement: 10, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Positive Thinker", rank: Image("R1pos"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: -10, hungerDrain: nil),
        Skill(name: "Runner", rank: Image("R2pos"), description: nil, attack: nil, defense: nil, movement: 20, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Suntan Lover", rank: Image("R1pos"), description: "Fire Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Swift", rank: Image("R3pos"), description: nil, attack: nil, defense: nil, movement: 30, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Unstable", rank: Image("R1neg"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: 10, hungerDrain: nil),
        Skill(name: "Waterproof", rank: Image("R1pos"), description: "Water Defense", attack: nil, defense: 10, movement: nil, workSpeed: nil, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Workaholic", rank: Image("R3pos"), description: nil, attack: nil, defense: nil, movement: nil, workSpeed: nil, sanityDrain: -15, hungerDrain: nil)
    ]
}
//Name,Rank,Description,Attack,Defense,Movement,
//Work,Sanity Drain, Hunger Drain,
