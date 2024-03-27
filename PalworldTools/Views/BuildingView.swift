//
//  BuildingView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/26/24.
//

import Foundation
import SwiftUI


struct BuildingView: View{
    var selectedBuilding: buildingItems // Change the type to buildingItems

    var body: some View{
        NavigationView{
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    if selectedBuilding.name.first != nil {
                        Text("Selected Building: \(selectedBuilding.name)")
                    } else {
                        Text("No building selected") // Handle the case where buildList is empty
                    }                }
            }
        }
    }
}



/*
 HStack {
     Text("Tier: ")
     Text("\(building.tier)")
         .frame(maxWidth: .infinity, alignment: .trailing)
 }
 HStack {
     Text("Points: ")
     Text("\(building.points)")
         .frame(maxWidth: .infinity, alignment: .trailing)
 }
 HStack {
     Text("Load: ")
     Text("\(building.workload)")
         .frame(maxWidth: .infinity, alignment: .trailing)
 }
 VStack {

     ForEach(building.mats.keys.sorted(by: { $0.name < $1.name }), id: \.self) { material in
         Button(action: {
             self.selectedMaterial = material
         }) {
             Text("\(material.name): \(building.mats[material] ?? 0)")
         }
         .frame(maxWidth: .infinity, alignment: .leading)
         .buttonStyle(PlainButtonStyle())
         .sheet(item: self.$selectedMaterial) { selectedMaterial in
             MatsView(item: selectedMaterial)
         }
     
     }
     
 }
 */

struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleBuilding = buildingItems(
            name: "Alarm Bell",icon: Image("Alarm_Bell"),tier: 4,points: 1,workload: 30,category: "Defense",materialQuantities: ["Paldium Fragment": 5, "Stone": 20], materialsListManagers: ["Paldium Fragment": MaterialsListManager(), "Stone": MaterialsListManager()])
        // Create a preview instance of BuildingView with a valid selectedBuildingManager
        return BuildingView(selectedBuilding: sampleBuilding)
    }
}


