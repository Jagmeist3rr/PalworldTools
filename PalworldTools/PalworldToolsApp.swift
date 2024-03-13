//
//  PalworldToolsApp.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import SwiftUI

@main
struct PalworldToolsApp: App {
    init() {
        // Change the background color of the tab bar
        UITabBar.appearance().barTintColor = UIColor(red: 143/255, green: 141/255, blue: 166/255, alpha: 1)
    }

    @StateObject var skillsManager = SkillsManager() // Initialize SkillsManager as a state object
    
    var body: some Scene {
        WindowGroup {
            let defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
            return ContentView()
                .environmentObject(defenseBuildingsManager)
                .environmentObject(skillsManager) // Provide skillsManager as an environment object
                .environmentObject(MaterialsListManager())
                .environmentObject(MaterialsManager())
        }
        }
    }

import SwiftUI
