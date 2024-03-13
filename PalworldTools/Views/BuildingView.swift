//
//  BuildingView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/12/24.
//

import Foundation
import SwiftUI

struct defenseBuildingView: View {
    @EnvironmentObject var defenseBuildingsManager: defenseBuildings
    @State private var selectedMaterial: materialsList? // Track selected material
    
    var body: some View {
        
        ZStack {
            
            List(defenseBuildingsManager.buildList, id: \.self) {
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
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
                return defenseBuildingView().environmentObject(defenseBuildingsManager)
    }
}
