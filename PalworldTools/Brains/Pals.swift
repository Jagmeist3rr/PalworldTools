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

class PalsWrapper: ObservableObject {
    @Published var pals: Pals
    
    init(pals: Pals) {
        self.pals = pals
    }
}

class PalsManager: ObservableObject{
    //Class where Pal information is good
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
            Pals(name: "Tanzee", icon: Image("Tanzee"), title: "Dexterous Primate", number: "008#", element: ["Grass"], drops: ["Mushroom"], food: 2, foodimage: foodImages, partnerSkill: "Cheery Rifle", partnerSkillDescription: "When activated, Tanzee will mercilessly fire an assault rifle at nearby enemies.", worksuitabilty: ["Plating": 1, "Handiwork": 1, "Gathering": 1, "Transporting": 1]),
            Pals(name: "Rooby", icon: Image("Rooby"), title: "Chief of the Herd", number: "#009", element: ["Fire"], drops: ["Flame Organ", "Leather"], food: 2, foodimage: foodImages, partnerSkill: "Tiny Spark", partnerSkillDescription: "While in team, increases attach power of Fire Pals", worksuitabilty: ["Kindling": 1]),
            Pals(name: "Pengullet", icon: Image("Pengullet"), title: "Ate Too Much", number: "#010", element: ["Water", "Ice"], drops: ["Ice Organ", "Pal Fluids"], food: 2, foodimage: foodImages, partnerSkill: "Pengullet Cannon", partnerSkillDescription: "When activated, the player equips a Rocket Launcher and fires Pengullet as ammunition. Pengullet explodes on contact and is incapacitated.", worksuitabilty: ["Watering": 1, "Handiwork": 1, "Cooling": 1, "Transporting": 1]),
            Pals(name: "Penking", icon: Image("Penking"), title: "Pioneer of the Frozen Sea", number: "#011", element: ["Water", "Ice"], drops: ["Ice Organ", "Penking Plume"], food: 8, foodimage: foodImages, partnerSkill: "Brave Sailor", partnerSkillDescription: "When fighting together, Fire Pals drop more items when defeated", worksuitabilty: ["Water": 2, "Handiwork": 2, "Mining": 2, "Cooling": 2, "Transporting": 2]),
            Pals(name: "Jolthog", icon: Image("Jolthog"), title: "Don't Touch!", number: "012", element: ["Electric"], drops: ["Electric Orga"], food: 2, foodimage: foodImages, partnerSkill: "Jolt Bomb", partnerSkillDescription: "When activated, equips Jolthog to the player's hand. When thrown at an enemy, causes an electrical explosion upon impact.", worksuitabilty: ["Generating Electricity": 1]),
            Pals(name: "Gumoss", icon: Image("Gumoss"), title: "Suddenly Transformed", number: "#013", element: ["Grass", "Ground"], drops: ["Berry Seeds", "Gumoss Leaf"], food: 1, foodimage: foodImages, partnerSkill: "Logging Assistance", partnerSkillDescription: "While in team, improves efficiency of cuttinh trees", worksuitabilty: ["Planting": 1]),
            Pals(name: "Vixy", icon: Image("Vixy"), title: "Star of the Steppe", number: "#014", element: ["Neutral"], drops: ["Leather", "Bones"], food: 1, foodimage: foodImages, partnerSkill: "Dig Here!", partnerSkillDescription: "Sometimes digs up items from the ground when assigned to Ranch", worksuitabilty: ["Gathering": 1, "Farming": 1]),
            Pals(name: "Hoocrates", icon: Image("Hoocrates"), title: "Purveyor of Wisdom", number: "#015", element: ["Dark"], drops: ["Fiber", "High Grade Technical Manual"], food: 3, foodimage: foodImages, partnerSkill: "Dark Knowledge", partnerSkillDescription: "While in team, increases attack of Dark Pals", worksuitabilty: ["Gathering": 1]),
            Pals(name: "Teafant", icon: Image("Teafant"), title: "Adorable Watering Can", number: "#016", element: ["Water"], drops: ["Pal Fluids"], food: 2, foodimage: foodImages, partnerSkill: "Soothing Shower", partnerSkillDescription: "When activated, spouts mysterious water that soothes wounds and restores player's HP.", worksuitabilty: ["Watering": 1]),
            Pals(name: "Depresso", icon: Image("Depresso"), title: "Several Sleepless Nights Later", number: "#017", element: ["Dark"], drops: ["Venom Gland"], food: 2, foodimage: foodImages, partnerSkill: "Caffeine Inoculation", partnerSkillDescription: "When activated, Depresso drinks a massive amount of energy drinks, causing its movement speed to increase.", worksuitabilty: ["Handiwork": 1, "Mining": 1, "Transporting": 1]),
            Pals(name: "Cremis", icon: Image("Cremis"), title: "Darling Furball", number: "#018", element: ["Neutral"], drops: ["Wool"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy Wool", partnerSkillDescription: "While in team, increases attack power of Neutral Pals. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Gathering": 1, "Farming": 1]),
            Pals(name: "Daedream", icon: Image("Daedream"), title: "Dream Eater", number: "#019", element: ["Dark"], drops: ["Venom Gland", "Small Pal Soul"], food: 3, foodimage: foodImages, partnerSkill: "Dream Chaser", partnerSkillDescription: "While in team, appears near the player. Follows up player attacks with magic bullets.", worksuitabilty: ["Handiwork": 1, "Gathering": 1, "Transporting": 1])
        ]
    }
    func elementIcons(element: String) -> Image{
        switch element{
            //Displays icon for images
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
            //Displays Icons for work suitabilty
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
            // Used to change font to black if work suitability is found for pal
            return .black
        } else {
            return .white
        }
    }
    
    func numberForElement(workname: String, worklist: [String: Int]) -> Int {
        //returns value of work suitabilty if found for pal
        if let value = worklist[workname] {
            return value
        } else {
            return 0
        }
    }

    
}
