//
//  MaterialsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/10/24.
//

import Foundation
import SwiftUI

struct MaterialsView: View {
    @EnvironmentObject var materialsManager: MaterialsManager // Inject MaterialsManager
    @EnvironmentObject var materialsListManager: MaterialsListManager //
    @State private var selectedItem: materialsList? // Track selected item

    var body: some View {
        ZStack {
            Color(hex: "#8f8da6")
                .edgesIgnoringSafeArea(.all)
            List(materialsListManager.matslistmanstruct, id: \.self) { material in
                    NavigationLink(destination: MatsView(item: material)) {
                        HStack {
                            material.image
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(material.name)
                        }
                    }
                .navigationBarTitle("Materials")
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    NavigationLink("Building Structures", destination: defenseBuildingView())
                    NavigationLink("Materials", destination: MaterialsView())
                    Text("Extra Button") // Add additional button if needed
                }
                .foregroundColor(.white)
                .padding() // Add padding as needed
            }
        }
    }
}


struct Materials_Previews: PreviewProvider {
    static var previews: some View {
        MaterialsView()
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
    }
}
