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
    @State private var selectedMaterial: materialsList? // Track selected material
    @State private var selectedBuildingManager: BuildingManager? // Track selected building manager

    @Binding var buildingManager: BuildingManager
    @StateObject var defenseBuildingsManager = defenseBuildings(buildList: [], materialsListManager: MaterialsListManager())
    @StateObject var otherBuildingsManager = otherBuildings(buildList: [], materialsListManager: MaterialsListManager())
    
    @State private var selectedMaterialIndex: Int? // Track selected material index
    @State private var isShowingMatsView = false

    init(buildingManager: Binding<BuildingManager>, selectedOption: Binding<String>) {
        self._buildingManager = buildingManager
        self._selectedOption = selectedOption
        let red = CGFloat(143) / 255.0 // Red component
        let green = CGFloat(141) / 255.0 // Green component
        let blue = CGFloat(166) / 255.0 // Blue component
        let alpha = CGFloat(0.0) // Alpha component (1.0 for fully opaque)

        let tabBarColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        UITabBar.appearance().backgroundColor = tabBarColor
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(hex: "#8f8da6")
                    .edgesIgnoringSafeArea(.all)
                NavigationView {
                    VStack{
                        List{
                            ForEach(buildingManager.buildList, id: \.self) { building in
                                VStack {
                                    HStack {
                                        building.icon
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Text(building.name)
                                            .font(.title)
                                        Spacer()
                                    }
                                    Divider()
                                        .padding(.horizontal,16)
                                    HStack(alignment: .top){
                                        HStack {
                                            VStack(alignment: .leading) {
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
                                                // Display other properties as needed
                                            }
                                            .alignmentGuide(.leading) { _ in
                                                0 // Align to the leading edge of the HStack
                                            }
                                            
                                            Divider()
                                                .frame(height: 70)
                                        }
                                        Spacer()
                                        
                                        VStack {
 
                                            buildarrays(buildingManager: buildingManager)
                                            
                                        }
                                        Spacer()
                                        
                                        
                                    }
                                    
                                }
                                
                                .foregroundColor(.black)
                                                    .listRowBackground(
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .background(.clear)
                                                            .foregroundColor(Color(red: 196/255, green: 195/255, blue: 212/255))
                                                            .padding(
                                                                EdgeInsets(
                                                                    top: 2,
                                                                    leading: 10,
                                                                    bottom: 10,
                                                                    trailing: 10)))
                                                    .listRowSeparator(.hidden)
                            }
                            .listRowBackground(Color(red: 196/255, green: 195/255, blue: 212/255))
                            .listStyle(.plain)
                            
                        }
                        .cornerRadius(25)
                        .background(Color(hex: "#8f8da6"))

                    }
                }
                .toolbar{
                    
                    Picker(selection: $selectedOption, label: Text("Select Option")) {
                        ForEach(tempoptions, id: \.self) {
                            Text($0)
                                .foregroundColor(.black)

                        }
                    }
                    .navigationBarTitle("Buildings", displayMode: .inline) // Set navigation title here

                    .frame(width: 120) // Set the width of the picker
                    .onChange(of: selectedOption) { newValue in
                        // Update the selected building manager based on the selected option
                        switch newValue {
                        case "Defenses":
                            buildingManager = defenseBuildingsManager
                        case "Other":
                            buildingManager = otherBuildingsManager
                        case "All":
                            buildingManager = allBuildings(defenseBuildingsManager: defenseBuildingsManager, otherBuildingsManager: otherBuildingsManager, materialsListManager: MaterialsListManager())
                        default:
                            break
                        }
                    }
                }
                //.navigationBarHidden(true)


                
                
                
            }

        } // Hide default navigation bar!
    }
}

struct buildarrays: View {
    //@ObservedObject selectMaterial: sele
    @EnvironmentObject var buildingManagerWarpper: BuildingManagerWrapper
    
    var body: some View{
        
        ForEach
        Text("Test")
    }
}

/*
 
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
 */
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
