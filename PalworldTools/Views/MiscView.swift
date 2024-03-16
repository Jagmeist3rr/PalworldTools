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
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(navigationLinks, id: \.0) { link in
                        HStack {
                            NavigationLink(link.0, destination: link.1)
                        }
                      
                        .listRowBackground(Color.white)

                           

                    }
                    
                }
                .cornerRadius(25)
                .foregroundColor(.black)
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitle("Pals", displayMode: .inline)
            .navigationBarTitleDisplayMode(.automatic)

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
