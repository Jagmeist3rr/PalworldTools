//
//  MiscView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/15/24.
//

import Foundation
import SwiftUI



struct MiscView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @StateObject var otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @State private var selectedOption = "Defenses"
    
    @State private var tempoptions = ["Defenses", "Other", "All"]
    @State private var selectedBuildingManager: BuildingManager? // Track selected building manager

    @State private var showButton = false // Flag to control button visibility
    @State private var selectedTab = 0 // Track selected tab index

    init() {
        let red = CGFloat(143) / 255.0 // Red component
        let green = CGFloat(141) / 255.0 // Green component
        let blue = CGFloat(166) / 255.0 // Blue component
        let alpha = CGFloat(0.0) // Alpha component (1.0 for fully opaque)

        let tabBarColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        UITabBar.appearance().backgroundColor = tabBarColor
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(navigationLinks, id: \.0) { link in
                        NavigationLink(link.0, destination: link.1)
                    }
                    
                }
                .cornerRadius(25)
                .foregroundColor(.black)
                .listStyle(PlainListStyle())

            }
            .navigationBarTitle("Misc", displayMode: .inline) // Set navigation title here
            .background(Color(hex: "#8f8da6")) // Set background color to match the view's color

        }

    }
    
    private var navigationLinks: [(String, AnyView)] {
        [
            ("Pal Skills", AnyView(PalSkills())),
            ("Materials", AnyView(MaterialsView())),
            ("Buildings", AnyView(defenseBuildingView(buildingManager: Binding(get: { selectedBuildingManager ?? defenseBuildingsManager }, set: { selectedBuildingManager = $0 }),selectedOption: $selectedOption)))
        ]
    }
}

struct MiscView_Preview: PreviewProvider {
    static var previews: some View {
        MiscView()
            .environmentObject(SkillsManager())
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
    }
}
