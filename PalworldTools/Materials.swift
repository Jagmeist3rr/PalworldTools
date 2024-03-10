//
//  Materials.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/9/24.
//

import Foundation
import SwiftUI

struct materialsStruct{
    var name:String
    var icon: Image
    var weight: Float
    var buyPrice: Int
    var sellPrice: Int
    var sources: [String]
}

struct materialsList{
    //List of Materials that display
    var name: String
    var image: Image
    var fullPage: materialsStruct
    
    init(name: String, image: Image, fullPage: materialsStruct) {
        self.name = name
        self.image = image
        self.fullPage = fullPage
    }

}


class MaterialsListManager: ObservableObject{
    @Published var matslistmanstruct: [materialsList] = []
    let materialsManager = MaterialsManager()
    
    init(){
        for material in materialsManager.matslist{
            let materialList = materialsList(name: material.name, image: material.icon, fullPage: material)
            matslistmanstruct.append(materialList)
        }
    }

    
}


class MaterialsManager: ObservableObject{
    @Published var matslist: [materialsStruct] = [
        materialsStruct(name: "Ancient Civilization Parts", icon: Image("materialAncientCivilizationPartsicon"), weight: 1, buyPrice: 0, sellPrice: 0, sources: ["Aplha Pals", "Loot"]),
        materialsStruct(name: "Berry Seeds", icon: Image("materialBerrySeedsicon"), weight: 0.05, buyPrice: 50, sellPrice: 5, sources: ["Red Berry Bush", "Pal Drop, Wandering Merchant"]),
        materialsStruct(name: "Bone", icon: Image("materialBoneicon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Wandering Merchant"]),
        materialsStruct(name: "Carbon Fiber", icon: Image("materialCarbonFibericon"), weight: 0.2, buyPrice: 0, sellPrice: 12, sources: ["Craft"]),
        materialsStruct(name: "Circuit Board", icon: Image("Circuit_Board_icon"), weight: 2, buyPrice: 0, sellPrice: 100, sources: ["Craft"]),
        materialsStruct(name: "Cloth", icon: Image("Cloth_icon"), weight: 1, buyPrice: 0, sellPrice: 8, sources: ["Craft"]),
        materialsStruct(name: "Coal", icon: Image("Coal_icon"), weight: 5, buyPrice: 0, sellPrice: 2, sources: ["Coal Rocks"]),
        materialsStruct(name: "Diamond", icon: Image("Diamond_icon"), weight: 5, buyPrice: 0, sellPrice: 1250, sources: ["High-level Dungeon Bosses", "Jetragon", "Frostallion", "Paladius"]),
        materialsStruct(name: "Electric Organ", icon: Image("Electric_Organ_icon"), weight: 0.5, buyPrice: 200, sellPrice: 20, sources: ["Pals", "Wandering Merchant"]),
        materialsStruct(name: "Emerald", icon: Image("Emerald_icon"), weight: 5, buyPrice: 0, sellPrice: 1000, sources: ["Chests"]),
        materialsStruct(name: "Flame Organ", icon: Image("Flame_Organ_icon"), weight: 0.5, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Wandering Merchant"]),
        materialsStruct(name: "Gold Coing", icon: Image("Gold_Coin_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: ["Pals", "Trading"]),
        materialsStruct(name: "Gumoss Leaf", icon: Image("Gumoss_Leaf_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Gumoss"]),
        materialsStruct(name: "Gunpowder", icon: Image("Gunpowder_icon"), weight: 0.2, buyPrice: 0, sellPrice: 22, sources: ["Craft"]),
        materialsStruct(name: "High Quality Cloth", icon: Image("High_Quality_Cloth_icon"), weight: 1, buyPrice: 0, sellPrice: 40, sources: ["Craft"]),
        materialsStruct(name: "Horn", icon: Image("Horn_icon"), weight: 1, buyPrice: 300, sellPrice: 30, sources: ["Pals", "Wandering Merchant"]),
        materialsStruct(name: "Ice Organ", icon: Image("Ice_Organ_icon"), weight: 0.5, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Wandering Merchant"]),
        materialsStruct(name: "Ingot", icon: Image("Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 0, sources: ["Craft"])
    ]
    
}
