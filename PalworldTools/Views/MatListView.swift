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
    @State private var isShowingPopup = false

    var body: some View {
            List(materialsListManager.matslistmanstruct, id: \.self) { material in
                NavigationLink(destination: MatsView(item: material)) {
                    HStack {
                        material.image
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text(material.name)
                    }
                }
            }
            .navigationBarTitle("Materials")
    }
}


struct Materials_Previews: PreviewProvider {
    static var previews: some View {
        MaterialsView()
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
    }
}
