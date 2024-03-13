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
    @State private var selectedOption = "Defenses"
    @State private var tempoptions = ["Defenses", "Other", "All"]
    @State private var options = ["Defenses", "Other", "Furniture", "Foundations", "Ligting", "Infrastructure", "Food", "Storage", "Pal", "Production"]
    @State private var buildingManager: BuildingManager
    @StateObject var defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @StateObject var otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager())

    @State private var selectedMaterial: materialsList? // Track selected material
    
    init(buildingManager: BuildingManager) {
          self._buildingManager = State(initialValue: buildingManager)
      }
    
    var body: some View {
        let allBuildinsManager = allBuildings(defenseBuildingsManager: defenseBuildingsManager, otherBuildingsManager: otherBuildingsManager, materialsListManager: MaterialsListManager())
        
        GeometryReader { geometry in
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                Picker(selection: $selectedOption, label: Text("Select Option")) {
                    ForEach(tempoptions, id: \.self) {
                        Text($0)
                    }
                }
                .foregroundColor(.black)
                .onChange(of: selectedOption) { newValue in
                    // Update the list contents based on the selected option
                    switch newValue {
                    case "Defenses":
                        buildingManager = defenseBuildingsManager
                    case "Other":
                        buildingManager = otherBuildingsManager
                    case "All":
                        buildingManager = allBuildinsManager
                    default:
                        break
                    }
                }
                List(buildingManager.buildList, id: \.self) {
                    building in
                    
                    VStack {
                        HStack {
                            building.icon
                            Text(building.name)
                                .font(.title)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Tier: \(building.tier)")
                                Text("Points: \(building.points)")
                                Text("Workload: \(building.workload)")
                                // Display other properties as needed
                            }
                            .padding()
                            VStack {
                                ForEach(building.mats.keys.sorted(by: { $0.name < $1.name }), id: \.self) { material in
                                    Button(action: {
                                        self.selectedMaterial = material
                                    }) {
                                        Text("\(material.name): \(building.mats[material] ?? 0)")
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .sheet(item: self.$selectedMaterial) { selectedMaterial in
                                        MatsView(item: selectedMaterial)
                                    }
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
        } // Hide default navigation bar
    }
}

struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        let defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
        let otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager()) // Initialize otherBuildingsManager here

        return defenseBuildingView(buildingManager: defenseBuildingsManager)
            .environmentObject(defenseBuildingsManager)
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
            .environmentObject(otherBuildingsManager)

    }
}
