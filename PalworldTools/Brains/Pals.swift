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
    var worksuitabilty: [workSuitability]
    
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
            Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy Shield", worksuitabilty: [workSuitability(name: "Handiwork", icon: Image("Handiwork_icon"), level: 1)])
        ]
    }
    
    
}
