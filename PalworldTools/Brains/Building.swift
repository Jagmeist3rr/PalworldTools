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


class buildingItemsListManager: ObservableObject{
    @Published var buildingListsruct: [buildingItemsList] = []
    
    
}

class defenseBuildings: ObservableObject {
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

