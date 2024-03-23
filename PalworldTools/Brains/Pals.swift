//
//  File.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/14/24.
//

import Foundation
import SwiftUI

struct Pals: Hashable {
    
    var name: String
    var icon: Image
    var title: String
    var number: String
    var element: [String]
    var drops: [String]
    var food: Int
    var foodimage: [Image]
    var partnerSkill: String
    var partnerSkillDescription: String
    var worksuitabilty: [String: Int]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(title)
        hasher.combine(number)
        hasher.combine(element)
        hasher.combine(drops)
        hasher.combine(food)
        hasher.combine(partnerSkill)
    }
}

extension Pals: Equatable {
    static func == (lhs: Pals, rhs: Pals) -> Bool {
        // Compare all properties to determine equality
        lhs.name == rhs.name &&
        lhs.icon == rhs.icon &&
        lhs.title == rhs.title &&
        lhs.number == rhs.number &&
        lhs.element == rhs.element &&
        lhs.drops == rhs.drops &&
        lhs.food == rhs.food &&
        lhs.foodimage == rhs.foodimage &&
        lhs.partnerSkill == rhs.partnerSkill
    }
}

struct workSuitability{
    var name: String
    var icon: Image
    var level: Int
}

class PalsWrapper: ObservableObject {
    @Published var pals: Pals
    
    init(pals: Pals) {
        self.pals = pals
    }
}

class PalsManager: ObservableObject{
    @Published var palsManager: [Pals]
    init(palsManager: [Pals]) {
        self.palsManager = palsManager
        
        var foodImages: [Image] = []
        for _ in 0..<2 { // Assuming `food` is always 2 as per your example
            foodImages.append(Image("Food_On")) // Replace "Food_On" with your actual food image name
        }
        

        self.palsManager = [
            Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy Shield", partnerSkillDescription: "When activated, equips to the player and becomes a shield. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Handiwork": 1, "Transporting": 1, "Farming": 1]),
            Pals(name: "Cattiva", icon: Image("Cattiva"), title: "The Cat's Pajamas", number: "#002", element: ["Neutral"], drops: ["Red Berries"], food: 2, foodimage: foodImages, partnerSkill: "Cat Helper", partnerSkillDescription: "While in team, Cattiva helps carry supplies, increasing the player's max carrying capacity.", worksuitabilty: ["Handiwork": 1,"Gathering":1,"Mining":1,"Transporting":1]),
            Pals(name: "Chikipi", icon: Image("Chikipi"), title: "Plumb & Juicy", number: "#003", element: ["Neutral"], drops: ["Egg", "Chikipi Poultry"], food: 1, foodimage: foodImages, partnerSkill: "Egg Layer", partnerSkillDescription: "Sometimes lays an Egg when assigned to Ranch.", worksuitabilty: ["Gathering": 1, "Farming":1]),
            Pals(name: "Lifmunk", icon: Image("Lifmunk"), title: "Coward of the Steppe", number: "#004", element: ["Grass"], drops: ["Berry Seeds", "Medical Supplies(L)"], food: 1, foodimage: foodImages, partnerSkill: "Lifmunk Recoil", partnerSkillDescription: "When activated, leaps into the player's head and uses a submachine gun to follows up player attacks.", worksuitabilty: ["Planting": 1, "Handiwork": 1,"Gathering":1,"Lumbering": 1, "Medicine Production": 1]),
            Pals(name: "Foxparks", icon: Image("Foxparks"), title: "Revealer of Paths", number: "#005", element: ["Fire"], drops: ["Leather", "Flame Organ"], food: 2, foodimage: foodImages, partnerSkill: "Huggy Fire", partnerSkillDescription: "When activated, leaps into the player's head and uses a submachine gun to follows up player attacks.", worksuitabilty: ["Kindling": 1]),
            Pals(name: "Fuack", icon: Image("Fuack"), title: "Rowdy Wave Ripper", number: "#006", element: ["Water"], drops: ["Leather", "Pal Fluids"], food: 2, foodimage: foodImages, partnerSkill: "Surfing Slam", partnerSkillDescription: "When activated, Fuack body surfs towards an enemy and slams into them.", worksuitabilty: ["Watering": 1, "Handiwork": 1, "Transporting": 1]),
            Pals(name: "Sparkit", icon: Image("Sparkit"), title: "Livewire Tabby", number: "#007", element: ["Electric"], drops: ["Electric Organ"], food: 2, foodimage: foodImages, partnerSkill: "Static Electricity", partnerSkillDescription: "While in team, increases attack power of Electric Pals", worksuitabilty: ["Generating Electricity": 1, "Handiwork": 1, "Transporting": 1]),
            Pals(name: "Tanzee", icon: Image("Tanzee"), title: "Dexterous Primate", number: "008#", element: ["Grass"], drops: ["Mushroom"], food: 2, foodimage: foodImages, partnerSkill: "Cheery Rifle", partnerSkillDescription: "When activated, Tanzee will mercilessly fire an assault rifle at nearby enemies.", worksuitabilty: ["Plating": 1, "Handiwork": 1, "Gathering": 1, "Transporting": 1])
        ]
    }
    func elementIcons(element: String) -> Image{
        switch element{
        case "Neutral":
            return Image("\(element)_icon")
        case "Dark":
            return Image("\(element)_icon")
        case "Electric":
            return Image("\(element)_icon")
        case "Fire":
            return Image("\(element)_icon")
        case "Grass":
            return Image("\(element)_icon")
        case "Ground":
            return Image("\(element)_icon")
        case "Ice":
            return Image("\(element)_icon")
        case "Water":
            return Image("\(element)_icon")
        case "Dragon":
            return Image("\(element)_icon")
            default:
                return Image("Neutral_icon")
        }
    }
    
    func workIcons(work: String) -> Image{
        switch work{
        case "Handiwork":
            return Image("\(work)_Icon")
        case "Kindling":
            return Image("\(work)_Icon")
        case "Watering":
            return Image("\(work)_Icon")
        case "Generating Electricity":
            return Image("Generating_Electricity_Icon")
        case "Gathering":
            return Image("\(work)_Icon")
        case "Lumbering":
            return Image("\(work)_Icon")
        case "Mining":
            return Image("\(work)_Icon")
        case "Medicine Production":
            return Image("Medicine_Production_Icon")
        case "Cooling":
            return Image("\(work)_Icon")
        case "Transporting":
            return Image("\(work)_Icon")
        case "Farming":
            return Image("\(work)_Icon")
        case "Planting":
            return Image("\(work)_Icon")
        default:
            return Image("Handiwork_Icon")
        }
    }
    
    func colorForElement(workname: String, worklist: [String: Int]) -> Color {
        if worklist.keys.contains(workname) {
            // Return a specific color when the element is found in the array
            return .black // Change this to the desired color
        } else {
            // Return a default color when the element is not found in the array
            return .white // Change this to the desired color
        }
    }
    
    func numberForElement(workname: String, worklist: [String: Int]) -> Int {
        if let value = worklist[workname] {
            return value
        } else {
            return 0
        }
    }

    
}
