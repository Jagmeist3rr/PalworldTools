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
                VStack {
                    //Spacer()
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: MaterialsView()) {
                                Text("Items")
                                    .frame(width: 80, height: 80) // Set the desired width and height
                            }
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .padding(.leading,40)
                        .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        Spacer()
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            
                            NavigationLink(destination: defenseBuildingView(buildingManager: Binding(get: { selectedBuildingManager ?? defenseBuildingsManager }, set: { selectedBuildingManager = $0 }),selectedOption: $selectedOption)) {
                                Text("Buildings")
                                    .frame(width: 80, height: 80) // Set the desired width and height
                            }
                        
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        .padding(.trailing,50)

                    }
                    .foregroundColor(.black)
                    .padding(.top, 100)
                    Spacer()
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Items")

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
