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
    var itemDescription: String
    
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
        materialsStruct(name: "Ancient Civilization Parts", icon: Image("materialAncientCivilizationPartsicon"), weight: 1, buyPrice: 0, sellPrice: 0, sources: ["Aplha Pals", "Loot"], itemDescription: "Debris excavatated from ancient ruins. Contains abundant information on lost technology. Extremely valuable, people from all walks of life are now seeking such crystals."),
        materialsStruct(name: "Berry Seeds", icon: Image("materialBerrySeedsicon"), weight: 0.05, buyPrice: 50, sellPrice: 5, sources: ["Red Berry Bush", "Pal Drop", "Merchant"], itemDescription: "Seeds that produce Red Berries. Necessary for starting a farm. Can be obtained when picking Red Berries."),
        materialsStruct(name: "Bone", icon: Image("materialBoneicon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"], itemDescription: "Bone collected from Pals. Used in the creation of high quality Paldium."),
        materialsStruct(name: "Carbon Fiber", icon: Image("materialCarbonFibericon"), weight: 0.2, buyPrice: 0, sellPrice: 12, sources: ["Craft"], itemDescription: "A lightweight yet sturdy material. Used to create armor among other equipment."),
        materialsStruct(name: "Cement", icon: Image("Cement_icon"), weight: 5, buyPrice: 0, sellPrice: 22, sources: ["Craft"], itemDescription: "Cement used for creating structures and more. Can be produced in a High Quality Workbench."),
        materialsStruct(name: "Chikipi Poultry", icon: Image("Chikipi_Poultry_icon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Chikipi"], itemDescription: "Chikipi meat. Light and easy to eat, it's a local favorite for residents of Palpagos Island."),
        materialsStruct(name: "Circuit Board", icon: Image("Circuit_Board_icon"), weight: 2, buyPrice: 0, sellPrice: 100, sources: ["Craft"], itemDescription: "Required to create precision equipment. Can be made with a Production Assembly Line."),
        materialsStruct(name: "Cloth", icon: Image("Cloth_icon"), weight: 1, buyPrice: 0, sellPrice: 8, sources: ["Craft"], itemDescription: "Cloth woven from Wool. Required to create armor."),
        materialsStruct(name: "Coal", icon: Image("Coal_icon"), weight: 5, buyPrice: 0, sellPrice: 2, sources: ["Coal Rocks"], itemDescription: "Coal often found in caves and other places. Required to create high quality metal."),
        materialsStruct(name: "Diamond", icon: Image("Diamond_icon"), weight: 5, buyPrice: 0, sellPrice: 1250, sources: ["Dungeon Bosses", "Jetragon", "Frostallion", "Paladius"], itemDescription: "A rare gemstone that glows brilliantly. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Egg", icon: Image("Egg_icon"), weight: 0.5, buyPrice: 50, sellPrice: 5, sources: ["Chikipi", "Loot", "Wandering Merchant"], itemDescription: "Delicious when fried, but can also be used to cook various meals. Chikipi produce them."),
        materialsStruct(name: "Electric Organ", icon: Image("Electric_Organ_icon"), weight: 0.5, buyPrice: 200, sellPrice: 20, sources: ["Pals", "Merchant"], itemDescription: "Material obtainable from Electric Pals. It stores electricity, but requires caution when used."),
        materialsStruct(name: "Emerald", icon: Image("Emerald_icon"), weight: 5, buyPrice: 0, sellPrice: 1000, sources: ["Chests"], itemDescription: "A gemstone that glows green. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Flame Organ", icon: Image("Flame_Organ_icon"), weight: 0.5, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"], itemDescription: "Material obtainable from Fire Pals. Can be used to make Fire Arrow and more."),
        materialsStruct(name: "Flour", icon: Image("Flour_icon"), weight: 0.1, buyPrice: 0, sellPrice: 0, sources: ["Wheat"], itemDescription: "Flour made from grinding Wheat. It can be used as an ingredient for Bread."),
        materialsStruct(name: "Gold Coin", icon: Image("Gold_Coin_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: ["Pals", "Trading"], itemDescription: "Currency traded on Palpagos Island. Can be exchanged for items and Pals with merchants."),
        materialsStruct(name: "Gumoss Leaf", icon: Image("Gumoss_Leaf_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Gumoss"], itemDescription: "Leaves dropped from a Gumoss. Used to make clothing."),
        materialsStruct(name: "Gunpowder", icon: Image("Gunpowder_icon"), weight: 0.2, buyPrice: 0, sellPrice: 22, sources: ["Craft"], itemDescription: "Gunpowder used to fire ammunition. Required to make bullets."),
        materialsStruct(name: "High Quality Cloth", icon: Image("High_Quality_Cloth_icon"), weight: 1, buyPrice: 0, sellPrice: 40, sources: ["Craft"], itemDescription: "High Quality Cloth woven from a large number of Wool. Required to create high quality armor."),
        materialsStruct(name: "High Quality Pal Oil", icon: Image("High_Quality_Pal_Oil_icon"), weight: 0.2, buyPrice: 300, sellPrice: 30, sources: ["Pals", "Wandering Merchant"], itemDescription: "High-quality oil that can be extracted from Pal. Necessary for making Polymer."),
        materialsStruct(name: "Horn", icon: Image("Horn_icon"), weight: 1, buyPrice: 300, sellPrice: 30, sources: ["Pals", "Merchant"], itemDescription: "Horn collected from Pals. Used to created medicine and more."),
        materialsStruct(name: "Ice Organ", icon: Image("Ice_Organ_icon"), weight: 0.5, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"], itemDescription: "Material obtainable from Ice Pals. Can be used to make Ice Mine and more."),
        materialsStruct(name: "Ingot", icon: Image("Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 0, sources: ["Craft"], itemDescription: "A material required to create metal weapons and armor. Refined from Ore using a furnace."),
        materialsStruct(name: "Katress Hair", icon: Image("Katress_Hair_icon"), weight: 0.2, buyPrice: 0, sellPrice: 0, sources: ["Katress"], itemDescription: "Hair dropped from a Katress. Used to make clothing."),
        materialsStruct(name: "Lamball Mutton", icon: Image("Lamball_Mutton_icon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Lamball"], itemDescription: "Lamball meat. Red meat with a unique flavor. Delicious, but takes some getting used to."),
        materialsStruct(name: "Large Pal Soul", icon: Image("Large_Pal_Soul_icon"), weight: 0.2, buyPrice: 0, sellPrice: 10, sources: ["Anubis", "Necromus", "Frostallion Noct", "Chests"], itemDescription: "A spirit left behind by a Pal. It can draw out hidden abilities if offered to a Statue of Power."),
        materialsStruct(name: "Leather", icon: Image("Leather_icon"), weight: 2, buyPrice: 150, sellPrice: 15, sources: ["Pals", "Wandering Merchant"], itemDescription: "Leather taken from a Pal, it serves as a defensive material. It can be obtained from certain Pals."),
        materialsStruct(name: "Lettuce Seeds", icon: Image("Lettuce_Seeds_icon"), weight: 0.15, buyPrice: 200, sellPrice: 20, sources: ["Merchants", "Bristla"], itemDescription: "Seeds that produce Lettuce"),
        materialsStruct(name: "Mushroom", icon: Image("Mushroom_icon"), weight: 1, buyPrice: 50, sellPrice: 5, sources: [""], itemDescription: "A mushroom that be eaten raw. They can be found anywhere on the island."),
        materialsStruct(name: "Medical Supplies(L)", icon: Image("Medical_Supplies_(L)_icon"), weight: 0.2, buyPrice: 240, sellPrice: 24, sources: ["Craft", "Pals"], itemDescription: "Low Grade Medical Supplies good for colds and sprains. They don't heal Health when eaten, however."),
        materialsStruct(name: "Medium Pal Soul", icon: Image("Medium_Pal_Soul_icon"), weight: 0.15, buyPrice: 0, sellPrice: 10, sources: ["Helzephyr", "Humans"], itemDescription: "A spirit left behind by a Pal. It can draw out hidden abilities if offered to a Statue of Power."),
        materialsStruct(name: "Nail", icon: Image("Nail_icon"), weight: 2, buyPrice: 0, sellPrice: 20, sources: ["Craft"], itemDescription: "Necessary for building various facilities. Can be made with a Primitive Workbench."),
        materialsStruct(name: "Ore", icon: Image("Ore_icon"), weight: 8, buyPrice: 0, sellPrice: 0, sources: ["Ore_Rock_icon"], itemDescription: "Becomes an ingot when refined using a furnace. Can be found in caves and other places. There are rumors of Pals capable of detecting ore."),
        materialsStruct(name: "Pal Fluids", icon: Image("Pal_Fluids_icon"), weight: 0.2, buyPrice: 0, sellPrice: 0, sources: ["Water-Type Pals"], itemDescription: "Body fluids taken from a Pal. Useful for its high viscosity."),
        materialsStruct(name: "Pal Metal Ingot", icon: Image("Pal_Metal_Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 80, sources: ["Craft", "Pals"], itemDescription: "Material required to create weapons and armor using Pal Metal. Made stronger by creating an alloy from metal and Paldium."),
        materialsStruct(name: "Paldium Fragment", icon: Image("Paldium_Fragment_icon"), weight: 1, buyPrice: 0, sellPrice: 0, sources: ["Paldium Rock", "Loot", "Lunaris"], itemDescription: "Crystallized energy from the World Tree. Capable of creating supernatural items and structures."),
        materialsStruct(name: "Penking Plume", icon: Image("Penking_Plume_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Penking"], itemDescription: "Plume dropped from a Penking. Used to make clothing."),
        materialsStruct(name: "Polymer", icon: Image("Polymer_icon"), weight: 0.5, buyPrice: 0, sellPrice: 0, sources: ["Craft"], itemDescription: "Made from refined oil. Required for producing various items such as rifles."),
        materialsStruct(name: "Precious Claw", icon: Image("Precious_Claw_icon"), weight: 0, buyPrice: 0, sellPrice: 650, sources: ["Alpha Pals", "Dungeon Boss"], itemDescription: "Extremely sharp claws collected from Pals. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Precious Dragon Stone", icon: Image("Precious_Dragon_Stone_icon"), weight: 0, buyPrice: 0, sellPrice: 1000, sources: ["Alpha Pals"], itemDescription: "A gemstone-like ball collected from Pals. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Precious Entrails", icon: Image("Precious_Entrails_icon"), weight: 0, buyPrice: 0, sellPrice: 850, sources: ["Alpha Pals"], itemDescription: "A heart that never stops beating collected from Pals. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Precious Pelt", icon: Image("Precious_Pelt_icon"), weight: 0, buyPrice: 0, sellPrice: 500, sources: ["Alpha Pals"], itemDescription: "Fluffy fur collected from pals. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Precious Plume", icon: Image("Precious_Plume_icon"), weight: 0, buyPrice: 0, sellPrice: 750, sources: ["Alpha Pals", "Dungeon Boss"], itemDescription: "Glittering feathers collected from Pals. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Pure Quartz", icon: Image("Pure_Quartz_icon"), weight: 5, buyPrice: 0, sellPrice: 10, sources: ["Pure Quartz Rocks", "Jetragon", "Astegon", "Frostallion Noct"], itemDescription: "Pure Quartz often found in snowy fields and similar places. Required to create Circuit Board."),
        materialsStruct(name: "Red Berries", icon: Image("Red_Berries_icon"), weight: 0.2, buyPrice: 50, sellPrice: 5, sources: ["Red Berry Bush", "Berry Plantation", "Wandering Merchant"], itemDescription: "A versatile ingredient that is delicious raw or cooked. They can be found anywhere on the island."),
        materialsStruct(name: "Refined Ingot", icon: Image("Refined_Ingot_icon"), weight: 5, buyPrice: 0, sellPrice: 0, sources: ["Craft"], itemDescription: "A material required to create metal weapons and armor. Refined from Ore and Coal using an Improved Furnace."),
        materialsStruct(name: "Ruby", icon: Image("Ruby_icon"), weight: 5, buyPrice: 0, sellPrice: 500, sources: ["Direhowl", "Relaxaurus", "Dungeon Chests"], itemDescription: "A gemstone that glows red. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Sapphire", icon: Image("Sapphire_icon"), weight: 5, buyPrice: 0, sellPrice: 750, sources: ["Mau Cryst", "Relaxaurus", "Vanwyrm Cryst", "Chests"], itemDescription: "A gemstone that glows blue. Can be sold to a merchant for a high price."),
        materialsStruct(name: "Small Paul Soul", icon: Image("Small_Pal_Soul_icon"), weight: 0.1, buyPrice: 0, sellPrice: 10, sources: ["Daedream", "Nox", "Cawgnito", "Maraith", "Felbat", "Loot"], itemDescription: "A spirit left behind by a Pal. It can draw out hidden abilities if offered to a Statue of Power."),
        materialsStruct(name: "Stone", icon: Image("Stone_icon"), weight: 3, buyPrice: 0, sellPrice: 0, sources: ["Rocks", "Loot"], itemDescription: "Materials for structures and items. Can be obtained by mining rocks."),
        materialsStruct(name: "Sulfur", icon: Image("Sulfur_icon"), weight: 3, buyPrice: 0, sellPrice: 0, sources: ["Sulfer Rocks", "Loot"], itemDescription: "Materials for items. Can be obtained by mining rocks."),
        materialsStruct(name: "Tocotoco Feather", icon: Image("Tocotoco_Feather_icon"), weight: 0.2, buyPrice: 0, sellPrice: 30, sources: ["Tocotoco"], itemDescription: "Feathers dropped from a Tocotoco. Used to make clothing, as the beautifully vivid colors are quite popular."),
        materialsStruct(name: "Tomato Seeds", icon: Image("Tomato_Seeds_icon"), weight: 0, buyPrice: 100, sellPrice: 10, sources: ["Broncherry", "Dinossom Lux", "Mossanda", "Merchant"], itemDescription: "Seeds that produce Tomato."),
        materialsStruct(name: "Venom Gland", icon: Image("Venom_Gland_icon"), weight: 0, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Merchant"], itemDescription: ""),
        materialsStruct(name: "Wheat Seeds", icon: Image("Wheat_Seeds_icon"), weight: 0.05, buyPrice: 100, sellPrice: 10, sources: ["Merchant", "Dinossom", "Bristla", "Robinquill"], itemDescription: "Seeds that produce Wheat."),
        materialsStruct(name: "Wood", icon: Image("Wood_icon"), weight: 3, buyPrice: 0, sellPrice: 1, sources: ["Tress", "Loot"], itemDescription:  "Material for structures and items. Can be obtained by cutting trees."),
        materialsStruct(name: "Wool", icon: Image("Wool_icon"), weight: 1, buyPrice: 100, sellPrice: 10, sources: ["Pals", "Ranch", "Merchant"], itemDescription: "Material sheared from sheep Pals. A necessity for creating bedding, Cloth and more.")
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
