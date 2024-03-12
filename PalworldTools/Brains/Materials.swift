//
//  Materials.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/9/24.
//

import Foundation
import SwiftUI

struct materialsStruct: Hashable{
    var name:String
    var icon: Image
    var weight: Float
    var buyPrice: Int
    var sellPrice: Int
    var sources: [String]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        //hasher.combine(icon)
        hasher.combine(weight)
        hasher.combine(buyPrice)
        hasher.combine(sellPrice)
        hasher.combine(sources)
    }
}

struct materialsList: Hashable,Identifiable, Equatable{
    //List of Materials that display
    var id = UUID() // Add Identifiable conformance
    var name: String
    var image: Image
    var fullPage: materialsStruct
    
    init(name: String, image: Image, fullPage: materialsStruct) {
        self.name = name
        self.image = image
        self.fullPage = fullPage
    }
    static func == (lhs: materialsList, rhs: materialsList) -> Bool {
            // Compare properties to determine equality
            return lhs.id == rhs.id // For example, you can compare the id property
        }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(fullPage)
    }
}


class MaterialsListManager: ObservableObject, Equatable, Hashable {
    @Published var matslistmanstruct: [materialsList] = []
    let materialsManager = MaterialsManager()
    
    init(){
        for material in materialsManager.matslist {
            let materialList = materialsList(name: material.name, image: material.icon, fullPage: material)
            matslistmanstruct.append(materialList)
        }
    }
    
    static func == (lhs: MaterialsListManager, rhs: MaterialsListManager) -> Bool {
        // Implement the equality check between instances of MaterialsListManager
        // For example, you can compare some properties to determine equality
        // This implementation compares object identity, which may be sufficient depending on your use case
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        // Implement the hash function using properties relevant to determining the identity of MaterialsListManager instances
        // For example, you can hash some properties of the manager
        // This implementation uses the object's identifier as its hash value
        hasher.combine(ObjectIdentifier(self))
    }
}


class MaterialsManager: ObservableObject{
    @Published var matslist: [materialsStruct] = [
        materialsStruct(name: "Ancient Civilization Parts", icon: Image("materialAncientCivilizationPartsicon"), weight: 1, buyPrice: 0, sellPrice: 0, sources: ["Aplha Pals", "Loot"]),
        materialsStruct(name: "Berry Seeds", icon: Image("materialBerrySeedsicon"), weight: 0.05, buyPrice: 50, sellPrice: 5, sources: ["Red Berry Bush", "Pal Drop", "Merchant"]),
        materialsStruct(name: "Bone", icon: Image("materialBoneicon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"]),
        materialsStruct(name: "Carbon Fiber", icon: Image("materialCarbonFibericon"), weight: 0.2, buyPrice: 0, sellPrice: 12, sources: ["Craft"]),
        materialsStruct(name: "Circuit Board", icon: Image("Circuit_Board_icon"), weight: 2, buyPrice: 0, sellPrice: 100, sources: ["Craft"]),
        materialsStruct(name: "Cloth", icon: Image("Cloth_icon"), weight: 1, buyPrice: 0, sellPrice: 8, sources: ["Craft"]),
        materialsStruct(name: "Coal", icon: Image("Coal_icon"), weight: 5, buyPrice: 0, sellPrice: 2, sources: ["Coal Rocks"]),
        materialsStruct(name: "Diamond", icon: Image("Diamond_icon"), weight: 5, buyPrice: 0, sellPrice: 1250, sources: ["Dungeon Bosses", "Jetragon", "Frostallion", "Paladius"]),
        materialsStruct(name: "Electric Organ", icon: Image("Electric_Organ_icon"), weight: 0.5, buyPrice: 200, sellPrice: 20, sources: ["Pals", "Merchant"]),
        materialsStruct(name: "Emerald", icon: Image("Emerald_icon"), weight: 5, buyPrice: 0, sellPrice: 1000, sources: ["Chests"]),
        materialsStruct(name: "Flame Organ", icon: Image("Flame_Organ_icon"), weight: 0.5, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"]),
        materialsStruct(name: "Gold Coin", icon: Image("Gold_Coin_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: ["Pals", "Trading"]),
        materialsStruct(name: "Gumoss Leaf", icon: Image("Gumoss_Leaf_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Gumoss"]),
        materialsStruct(name: "Gunpowder", icon: Image("Gunpowder_icon"), weight: 0.2, buyPrice: 0, sellPrice: 22, sources: ["Craft"]),
        materialsStruct(name: "High Quality Cloth", icon: Image("High_Quality_Cloth_icon"), weight: 1, buyPrice: 0, sellPrice: 40, sources: ["Craft"]),
        materialsStruct(name: "Horn", icon: Image("Horn_icon"), weight: 1, buyPrice: 300, sellPrice: 30, sources: ["Pals", "Merchant"]),
        materialsStruct(name: "Ice Organ", icon: Image("Ice_Organ_icon"), weight: 0.5, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"]),
        materialsStruct(name: "Ingot", icon: Image("Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 0, sources: ["Craft"]),
        materialsStruct(name: "Katress Hair", icon: Image("Katress_Hair_icon"), weight: 0.2, buyPrice: 0, sellPrice: 0, sources: ["Katress"]),
        materialsStruct(name: "Large Pal Soul", icon: Image("Large_Pal_Soul_icon"), weight: 0.2, buyPrice: 0, sellPrice: 10, sources: ["Anubis", "Necromus", "Frostallion Noct", "Chests"]),
        materialsStruct(name: "Leather", icon: Image("Leather_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: [""]),
        materialsStruct(name: "Lettuce Seeds", icon: Image("Lettuce_Seeds_icon"), weight: 0.15, buyPrice: 200, sellPrice: 20, sources: ["Merchants", "Bristla"]),
        materialsStruct(name: "Medium Pal Soul", icon: Image("Medium_Pal_Soul_icon"), weight: 0.15, buyPrice: 0, sellPrice: 10, sources: ["Helzephyr", "Humans"]),
        materialsStruct(name: "Nail", icon: Image("Nail_icon"), weight: 2, buyPrice: 0, sellPrice: 20, sources: ["Craft"]),
        materialsStruct(name: "Ore", icon: Image("Ore_icon"), weight: 8, buyPrice: 0, sellPrice: 0, sources: ["Ore_Rock_icon"]),
        materialsStruct(name: "Pal Fluids", icon: Image("Pal_Fluids_icon"), weight: 0.2, buyPrice: 0, sellPrice: 0, sources: ["Water-Type Pals"]),
        materialsStruct(name: "Pal Metal Ingot", icon: Image("Pal_Metal_Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 80, sources: ["Craft", "Pals"]),
        materialsStruct(name: "Paldium Fragment", icon: Image("Paldium_Fragment_icon"), weight: 1, buyPrice: 0, sellPrice: 0, sources: ["Paldium Rock", "Loot", "Lunaris"]),
        materialsStruct(name: "Penking Plume", icon: Image("Penking_Plume_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Penking"]),
        materialsStruct(name: "Polymer", icon: Image("Polymer_icon"), weight: 0.5, buyPrice: 0, sellPrice: 0, sources: ["Craft"]),
        materialsStruct(name: "Precious Claw", icon: Image("Precious_Claw_icon"), weight: 0, buyPrice: 0, sellPrice: 650, sources: ["Alpha Pals", "Dungeon Boss"]),
        materialsStruct(name: "Precious Dragon Stone", icon: Image("Precious_Dragon_Stone_icon"), weight: 0, buyPrice: 0, sellPrice: 1000, sources: ["Alpha Pals"]),
        materialsStruct(name: "Precious Entrails", icon: Image("Precious_Entrails_icon"), weight: 0, buyPrice: 0, sellPrice: 850, sources: ["Alpha Pals"]),
        materialsStruct(name: "Precious Pelt", icon: Image("Precious_Pelt_icon"), weight: 0, buyPrice: 0, sellPrice: 500, sources: ["Alpha Pals"]),
        materialsStruct(name: "Precious Plume", icon: Image("Precious_Plume_icon"), weight: 0, buyPrice: 0, sellPrice: 750, sources: ["Alpha Pals", "Dungeon Boss"]),
        materialsStruct(name: "Pure Quartz", icon: Image("Pure_Quartz_icon"), weight: 5, buyPrice: 0, sellPrice: 10, sources: ["Pure Quartz Rocks", "Jetragon", "Astegon", "Frostallion Noct"]),
        materialsStruct(name: "Refined Ingot", icon: Image("Refined_Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 0, sources: ["Craft"]),
        materialsStruct(name: "Ruby", icon: Image("Ruby_icon"), weight: 5, buyPrice: 0, sellPrice: 500, sources: ["Direhowl", "Relaxaurus", "Dungeon Chests"]),
        materialsStruct(name: "Sapphire", icon: Image("Sapphire_icon"), weight: 5, buyPrice: 0, sellPrice: 750, sources: ["Mau Cryst", "Relaxaurus", "Vanwyrm Cryst", "Chests"]),
        materialsStruct(name: "Small Paul Soul", icon: Image("Small_Pal_Soul_icon"), weight: 0.1, buyPrice: 0, sellPrice: 10, sources: ["Daedream", "Nox", "Cawgnito", "Maraith", "Felbat", "Loot"]),
        materialsStruct(name: "Stone", icon: Image("Stone_icon"), weight: 3, buyPrice: 0, sellPrice: 0, sources: ["Rocks", "Loot"]),
        materialsStruct(name: "Sulfur", icon: Image("Sulfur_icon"), weight: 3, buyPrice: 0, sellPrice: 0, sources: ["Sulfer Rocks", "Loot"]),
        materialsStruct(name: "Tocotoco Feather", icon: Image("Tocotoco_Feather_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Tocotoco"]),
        materialsStruct(name: "Tomato Seeds", icon: Image("Tomato_Seeds_icon"), weight: 0, buyPrice: 100, sellPrice: 10, sources: ["Broncherry", "Dinossom Lux", "Mossanda", "Merchant"]),
        materialsStruct(name: "Venom Gland", icon: Image("Venom_Gland_icon"), weight: 0, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"]),
        materialsStruct(name: "Wheat Seeds", icon: Image("Wheat_Seeds_icon"), weight: 0.05, buyPrice: 100, sellPrice: 10, sources: ["Merchant", "Dinossom", "Bristla", "Robinquill"]),
        materialsStruct(name: "Wood", icon: Image("Wood_icon"), weight: 3, buyPrice: 0, sellPrice: 1, sources: ["Tress", "Loot"]),
        materialsStruct(name: "Wool", icon: Image("Wool_icon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Ranch", "Merchant"])
    ]
    
    func createMaterialsList() -> [materialsList] {
         var materialsListArray: [materialsList] = []
         for material in matslist {
             _ = UUID() // Generate a UUID for each materialsList instance
             let materialsListItem = materialsList(name: material.name, image: material.icon, fullPage: material)
             materialsListArray.append(materialsListItem)
         }
         return materialsListArray
     }
}
