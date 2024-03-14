//
//  BuildingView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/12/24.
//

import Foundation
import SwiftUI

struct defenseBuildingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedOption: String
    @State private var tempoptions = ["Defenses", "Other", "All"]
    
    @Binding var buildingManager: BuildingManager
    @StateObject var defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @StateObject var otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager())
    
    @State private var selectedMaterialIndex: Int? // Track selected material index
    
    init(buildingManager: Binding<BuildingManager>, selectedOption: Binding<String>) {
        self._buildingManager = buildingManager
        self._selectedOption = selectedOption
    }
    
    var body: some View {
        let allBuildinsManager = allBuildings(defenseBuildingsManager: defenseBuildingsManager, otherBuildingsManager: otherBuildingsManager, materialsListManager: MaterialsListManager())
        
        GeometryReader { geometry in
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    List(buildingManager.buildList, id: \.self) { building in
                        VStack {
                            HStack {
                                building.icon
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text(building.name)
                                    .font(.title)
                                Spacer()
                            }
                            HStack(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("Tier: \(building.tier)")
                                    Text("Points: \(building.points)")
                                    Text("Workload: \(building.workload)")
                                    // Display other properties as needed
                                }
                                .alignmentGuide(.leading) { _ in
                                    0 // Align to the leading edge of the HStack
                                }
                                Spacer()
                                VStack {
                                    ForEach(building.mats.keys.sorted(by: { $0.name < $1.name }), id: \.self) { material in
                                        let index = building.mats.keys.sorted(by: { $0.name < $1.name }).firstIndex(of: material)!
                                        NavigationLink(
                                            destination: MatsView(item: material),
                                            tag: index,
                                            selection: $selectedMaterialIndex
                                        ) {
                                            HStack {
                                                Text(material.name) // Display the material name
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color(red: 196/255, green: 195/255, blue: 212/255))
                    }
                    .listStyle(PlainListStyle()) // Apply PlainListStyle to remove default list style
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                // Reset selectedMaterialIndex when the view appears
                selectedMaterialIndex = nil
            }
        } // Hide default navigation bar
    }
}


struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        let defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
        let otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager()) // Initialize otherBuildingsManager here
        // Create a binding to the defenseBuildingsManager instance
        let defenseBuildingsBinding = Binding<BuildingManager>(
            get: { defenseBuildingsManager },
            set: { _ in }
        )

        return defenseBuildingView(buildingManager: defenseBuildingsBinding, selectedOption: .constant("Defenses"))
            .environmentObject(defenseBuildingsManager)
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
            .environmentObject(otherBuildingsManager)
        
    }
}
