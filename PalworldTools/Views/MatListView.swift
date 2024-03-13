//
//  MaterialsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/10/24.
//

import Foundation
import SwiftUI

struct MaterialsView: View {
    @Environment(\.presentationMode) var presentationMode

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

            .navigationBarHidden(true) // Hide default navigation bar

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
