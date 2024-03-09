//
//  PalworldToolsApp.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import SwiftUI

@main
struct PalworldToolsApp: App {
    @StateObject var skillsManager = SkillsManager() // Initialize SkillsManager as a state object
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(skillsManager) // Provide skillsManager as an environment object
        }
    }
}
