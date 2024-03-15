//
//  File.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/14/24.
//

import Foundation
import SwiftUI

struct Pals: Hashable{
    
    var name: String
    var icon: Image
    var title: String
    var number: String
    var element: [String]
    var drops: [String]
    var food: Int
    var foodimage: [Image]
    var partnerSkill: String
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


class PalsManager: ObservableObject{
    @Published var palsManager: [Pals]
    //["Handiwork": 1, "Transporting": 1]
    init(palsManager: [Pals]) {
        self.palsManager = palsManager
        
        var foodImages: [Image] = []
        for _ in 0..<2 { // Assuming `food` is always 2 as per your example
            foodImages.append(Image("Food_On")) // Replace "Food_On" with your actual food image name
        }
        

        self.palsManager = [
            Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy Shield", worksuitabilty: ["Handiwork": 1]),
            Pals(name: "Cattiva", icon: Image("Cattiva"), title: "The Cat's Pajamas", number: "#002", element: ["Neutral"], drops: ["Red Berries"], food: 2, foodimage: foodImages, partnerSkill: "Cat Helper", worksuitabilty: ["Handiwork": 1,"Gathering":1,"Mining":1,"Transporting":1]),
            Pals(name: "Chikipi", icon: Image("Chikipi"), title: "Plumb & Juicy", number: "#003", element: ["Neutral"], drops: ["Egg", "Chikipi Poultry"], food: 1, foodimage: foodImages, partnerSkill: "Egg Layer", worksuitabilty: ["Gathering": 1, "Farming":1]),
            Pals(name: "Lifmunk", icon: Image("Lifmunk"), title: "Coward of the Steppe", number: "#004", element: ["Grass"], drops: ["Berry Seeds", "Low Grade Medical Supplies"], food: 1, foodimage: foodImages, partnerSkill: "Lifmunk Recoil", worksuitabilty: ["Planting": 1, "Handiwork": 1,"Gathering":1,"Lumbering": 1, "Medicine Production": 1]),
            Pals(name: "Foxparks", icon: Image("Foxparks"), title: "Revealer of Paths", number: "#005", element: ["Fire", "Water"], drops: ["Leather", "Flame Organ"], food: 2, foodimage: foodImages, partnerSkill: "Huggy Fire", worksuitabilty: ["Kindling": 1])
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
        case "Transorting":
            return Image("\(work)_Icon")
        case "Farming":
            return Image("\(work)_Icon")
        case "Planting":
            return Image("\(work)_Icon")
        default:
            return Image("Handiwork_Icon")
        }
    }
    
}
