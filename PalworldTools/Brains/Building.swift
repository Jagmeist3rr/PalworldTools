//
//  Building.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/12/24.
//

import Foundation
import SwiftUI

struct buildingItems: Hashable {
    var name: String
    var icon: Image
    var tier: Int
    var points: Int
    var workload: Int
    var category: String
    var mats: [materialsList: Int] = [:]
    var materialsListManagers: [String: MaterialsListManager] // Dictionary to hold multiple materialsListManager
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(tier)
        hasher.combine(points)
        hasher.combine(workload)
        hasher.combine(mats)
        hasher.combine(category)
        hasher.combine(materialsListManagers)
    }
    
    init(name: String, icon: Image, tier: Int, points: Int, workload: Int, category: String, materialQuantities: [String: Int], materialsListManagers: [String: MaterialsListManager]) {
        self.name = name
        self.icon = icon
        self.tier = tier
        self.points = points
        self.workload = workload
        self.category = category
        self.materialsListManagers = materialsListManagers
        
        // Populate mats dictionary by looking up materials in MaterialsListManager
        for (materialName, quantity) in materialQuantities {
            if let material = materialsListManagers[materialName]?.matslistmanstruct.first(where: { $0.name == materialName }) {
                self.mats[material] = quantity // You can set the quantity here if needed
            }
        }
    }
}

extension buildingItems: Equatable {
    static func == (lhs: buildingItems, rhs: buildingItems) -> Bool {
        // Compare all properties to determine equality
        lhs.name == rhs.name &&
        lhs.icon == rhs.icon &&
        lhs.tier == rhs.tier &&
        lhs.points == rhs.points &&
        lhs.workload == rhs.workload &&
        lhs.category == rhs.category &&
        lhs.mats == rhs.mats &&
        lhs.materialsListManagers == rhs.materialsListManagers
    }
}


struct buildingItemsList: Hashable, Identifiable, Equatable{
    var id = UUID()
    var name: String
    var icon: Image
    var fullPage: buildingItems
    
    init(id: UUID = UUID(), name: String, icon: Image, fullPage: buildingItems) {
        self.id = id
        self.name = name
        self.icon = icon
        self.fullPage = fullPage
    }
    
    static func == (lhs: buildingItemsList, rhs: buildingItemsList) -> Bool {
            // Compare properties to determine equality
            return lhs.id == rhs.id // For example, you can compare the id property
        }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
           hasher.combine(fullPage)
       }
    
}

protocol BuildingManager {
    var buildList: [buildingItems] { get set }
    // Add any other required properties or methods here
}

class defenseBuildings: ObservableObject, BuildingManager{
    @Published var buildList: [buildingItems]
    
    let materialsListManager: MaterialsListManager

    init(buildList: [buildingItems], materialsListManager: MaterialsListManager) {
        self.buildList = buildList // Assigning the parameter value to the class property
        self.materialsListManager = materialsListManager
        
        // Creating building items and assigning them to buildList
        self.buildList = [
            buildingItems(
                name: "Alarm Bell",icon: Image("Alarm_Bell"),tier: 4,points: 1,workload: 30,category: "Defense",materialQuantities: ["Paldium Fragment": 5, "Stone": 20], materialsListManagers: ["Paldium Fragment": MaterialsListManager(), "Stone": MaterialsListManager()]),
            buildingItems(name: "Bear Trap(Large)", icon: Image("Bear_Trap(Large)"), tier: 22, points: 2, workload: 0, category: "Defenses", materialQuantities: ["Ingot": 20], materialsListManagers: ["Ingot": MaterialsListManager()]),
            buildingItems(name: "Bear Trap(Small)", icon: Image("Bear_Trap(Small)"), tier: 10, points: 1, workload: 0, category: "Defenses", materialQuantities: ["Ingot": 5], materialsListManagers: ["Ingot": MaterialsListManager()]),
            buildingItems(name: "Eletric Mine", icon: Image("Electric_Mine"), tier: 33, points: 2, workload: 0, category: "Defense", materialQuantities: ["Ingot": 5, "Electric Organ": 2], materialsListManagers: ["Ingot": MaterialsListManager(), "Electric Organ": MaterialsListManager()]),
            buildingItems(name: "Hanging Trap", icon: Image("Hanging_Trap"), tier: 4, points: 1, workload: 0, category: "Defense", materialQuantities: ["Wood": 10, "Stone": 5], materialsListManagers: ["Wood": MaterialsListManager(), "Stone": MaterialsListManager()]),
            buildingItems(name: "Ice Mine", icon: Image("Ice_Mine"), tier: 38, points: 2, workload: 0, category: "Defenses", materialQuantities: ["Ingot": 5, "Ice Organ": 2], materialsListManagers: ["Ingot": MaterialsListManager(), "Ice Organ": MaterialsListManager()]),
            buildingItems(name: "Mine", icon: Image("Mine"), tier: 30, points: 2, workload: 0, category: "Defenses", materialQuantities: ["Ingot": 5, "Flame Organ": 2], materialsListManagers: ["Ingot": MaterialsListManager(), "Flame Organ": MaterialsListManager()]),
            buildingItems(name: "Mounted Crossbow", icon: Image("Mounted_Crossbow"), tier: 26, points: 2, workload: 0, category: "Defenses", materialQuantities: ["Ingot": 30, "Wood": 30, "Stone": 15, "Nail": 5], materialsListManagers: ["Ingot": MaterialsListManager(), "Wood": MaterialsListManager(), "Stone": MaterialsListManager(), "Nail": MaterialsListManager()]),
            buildingItems(name: "Mounted Machine Gun", icon: Image("Mounted_Machine_Gun"), tier: 40, points: 3, workload: 500, category: "Defenses", materialQuantities: ["Ingot": 30, "Nail": 10, "Cement": 15], materialsListManagers: ["Ingot": MaterialsListManager(), "Nail": MaterialsListManager(), "Cement": MaterialsListManager()]),
            buildingItems(name: "Mounted Missle Launcher", icon: Image("Mounted_Missle_Launcher"), tier: 50, points: 3, workload: 0, category: "Defenses", materialQuantities: ["Refined Ingot": 100, "Circuit Board": 20, "Nail": 20, "Cement": 50], materialsListManagers: ["Refined Ingot": MaterialsListManager(), "Circuit Board": MaterialsListManager(), "Nail": MaterialsListManager(), "Cement": MaterialsListManager()]),
            buildingItems(name: "Sand Bag", icon: Image("Sand_Bag"), tier: 9, points: 2, workload: 30, category: "Defenses", materialQuantities: ["Wood": 10, "Stone": 10], materialsListManagers: ["Wood": MaterialsListManager(), "Stone": MaterialsListManager()])
        ]
    }
}

class otherBuildings: ObservableObject, BuildingManager{
    @Published var buildList: [buildingItems]
    
    let materialsListManager: MaterialsListManager

    init(buildList: [buildingItems], materialsListManager: MaterialsListManager) {
        self.buildList = buildList // Assigning the parameter value to the class property
        self.materialsListManager = materialsListManager
        
        // Creating building items and assigning them to buildList
        self.buildList = [
            buildingItems(name: "Electric Pylon", icon: Image("Electric_Pylon"), tier: 48, points: 2, workload: 600, category: "Others", materialQuantities: ["Ingot": 100, "Electric Organ": 30, "Circuit Board": 20], materialsListManagers: ["Ingot": MaterialsListManager(), "Electric Organ": MaterialsListManager(), "Circuit Board": MaterialsListManager()]),
            buildingItems(name: "Flame Cauldron", icon: Image("Flame_Cauldron"), tier: 20, points: 2, workload: 160, category: "Other", materialQuantities: ["Ingot": 50, "Wood": 100, "Flame Ogran": 20], materialsListManagers: ["Ingot": MaterialsListManager(), "Wood": MaterialsListManager(), "Flame Ogran": MaterialsListManager()]),
            buildingItems(name: "Flower Bed", icon: Image("Flower_Bed"), tier: 24, points: 2, workload: 320, category: "Other", materialQuantities: ["Wood": 50, "Stone": 100, "Cement": 40, "Beautiful Flower": 20], materialsListManagers: ["Wood": MaterialsListManager(), "Stone": MaterialsListManager(), "Cement": MaterialsListManager(), "Beautiful Flower": MaterialsListManager()]),
            buildingItems(name: "Large Toolbox", icon: Image("Large_Toolbox"), tier: 19, points: 2, workload: 120, category: "Other", materialQuantities: ["Ingot": 40, "Wood": 100, "Nail": 15], materialsListManagers: ["Ingot": MaterialsListManager(), "Wood": MaterialsListManager(), "Nail": MaterialsListManager()]),
            buildingItems(name: "Pickaxe and Helmet", icon: Image("Pickaxe_and_Helmet"), tier: 30, points: 2, workload: 480, category: "Other", materialQuantities: ["Wood": 50, "Stone": 50, "Ingot": 50], materialsListManagers: ["Wood": MaterialsListManager(), "Stone": MaterialsListManager(), "Ingot": MaterialsListManager()]),
            buildingItems(name: "Sign", icon: Image("Signboard"), tier: 7, points: 1, workload: 0, category: "Other", materialQuantities: ["Wood": 10], materialsListManagers: ["Wood": MaterialsListManager()]),
            buildingItems(name: "Silo", icon: Image("Silo"), tier: 25, points: 2, workload: 400, category: "Other", materialQuantities: ["Wood": 300, "Stone": 100, "Fiber": 100], materialsListManagers: ["Wood": MaterialsListManager(), "Stone": MaterialsListManager(), "Fiber": MaterialsListManager()]),
            buildingItems(name: "Snowman", icon: Image("Snowman"), tier: 33, points: 2, workload: 400, category: "Other", materialQuantities: ["Ice Organ": 50, "Wood": 50, "Cloth": 20], materialsListManagers: ["Ice Organ": MaterialsListManager(), "Wood": MaterialsListManager(), "Cloth": MaterialsListManager()]),
            buildingItems(name: "Stump and Axe", icon: Image("Stump_and_Axe"), tier: 28, points: 2, workload: 320, category: "Other", materialQuantities: ["Wood": 150, "Ingot": 40, "Stone": 30], materialsListManagers: ["Wood": MaterialsListManager(), "Ingot": MaterialsListManager(), "Stone": MaterialsListManager()]),
            buildingItems(name: "Training Dummy", icon: Image("Training_Dummy"), tier: 13, points: 2, workload: 20, category: "Other", materialQuantities: ["Wood": 20, "Fiber": 5, "Paldium Fragment": 5], materialsListManagers: ["Wood": MaterialsListManager(), "Fiber": MaterialsListManager(), "Paldium Fragment": MaterialsListManager()]),
            buildingItems(name: "Water Fountain", icon: Image("Water_Fountain"), tier: 23, points: 2, workload: 200, category: "Other", materialQuantities: ["Ingot": 100, "Stone": 200, "Pal Fluids": 20], materialsListManagers: ["Ingot": MaterialsListManager(), "Stone": MaterialsListManager(), "Pal Fluids": MaterialsListManager()]),
            buildingItems(name: "Witch Cauldron", icon: Image("Witch_Cauldron"), tier: 32, points: 2, workload: 600, category: "Other", materialQuantities: ["Ingot": 50, "Stone": 50], materialsListManagers: ["Ingot": MaterialsListManager(), "Stone": MaterialsListManager()])
        ]
    }
}

class allBuildings: ObservableObject, BuildingManager{
    @Published var buildList: [buildingItems]
    
    let materialsListManager: MaterialsListManager

    init(defenseBuildingsManager: defenseBuildings, otherBuildingsManager: otherBuildings, materialsListManager: MaterialsListManager) {
            self.materialsListManager = materialsListManager
            // Combine the buildList arrays from defenseBuildings and otherBuildings
            self.buildList = defenseBuildingsManager.buildList + otherBuildingsManager.buildList
        }
}
