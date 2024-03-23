//
//  ItemViews.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/11/24.
//

import Foundation
import SwiftUI

struct MatsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var materialsListManager: MaterialsListManager
    @EnvironmentObject var materialsManager: MaterialsManager
    var item: materialsList
    
    var body: some View {
        let roundedWeight = String(format: "%.2f", item.fullPage.weight)
        
        VStack {
            HStack() {
                item.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(item.name)
            }
            .padding()
            
            Divider() // Add a divider for separation
            
            VStack(alignment: .leading, spacing: 10) {


                Text(item.fullPage.itemDescription)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Divider()
                VStack(alignment: .leading){
                    Text("Weight: \(roundedWeight)")
                    Text("Buy Price: \(item.fullPage.buyPrice)")
                    Text("Sell Price: \(item.fullPage.sellPrice)")
                }

            }
            .padding()
            Spacer()
        }
        .background(Color(red: 196/255, green: 195/255, blue: 212/255))
        .navigationBarTitle("", displayMode: .inline) // Clear the navigation bar title
    }
}


struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MatsView(item: materialsList(name: "Gold Coin", image: Image("Gold_Coin_icon"), fullPage: materialsStruct(name: "Gold Coin", icon: Image("Gold_Coin_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: ["Pals", "Trading"], itemDescription: "Test Description")))
            .environmentObject(MaterialsListManager())
    }
}

