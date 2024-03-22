//
//  MatsByNameView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/21/24.
//

import Foundation
import SwiftUI


struct MatsByNameView: View {
    var materialName: String
    @EnvironmentObject var materialsListManager: MaterialsListManager

    var body: some View {
        if let material = materialsListManager.matslistmanstruct.first(where: { $0.name == materialName }) {
            MatsView(item: material)
        } else {
            Text("Material not found")
        }
    }
}




/*
struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MatsView(item: materialsList(name: "Gold Coin", image: Image("Gold_Coin_icon"), fullPage: materialsStruct(name: "Gold Coin", icon: Image("Gold_Coin_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: ["Pals", "Trading"])))
            .environmentObject(MaterialsListManager())
    }
}
*/
