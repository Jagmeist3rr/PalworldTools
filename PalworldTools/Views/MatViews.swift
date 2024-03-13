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
        let roundedweight = String(format: "%.2f", item.fullPage.weight)
        
        ZStack {
            Color(hex: "#8f8da6")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack() { // Align items to the top
                    item.image
                    Text(item.name)
                }
                Spacer()
                    VStack {
                        HStack{
                            Text("Weight:")
                                .padding(.leading)
                            Text("\(roundedweight)")
                            Spacer()

                        }
                        HStack{
                            Text("Buy Price:")
                                .padding(.leading)
                            Text("\(item.fullPage.buyPrice)")
                            Spacer()

                        }
                        HStack{
                            Text("Sell Price:")
                                .padding(.leading)
                            Text("\(item.fullPage.sellPrice)")
                            Spacer()

                        }
                    }
                
                    Spacer()
                    VStack {
                        HStack{
                            Text("How to Obtain:")
                                .padding(.leading)
                            Spacer()
                        }
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MatsView(item: materialsList(name: "Gold Coin", image: Image("Gold_Coin_icon"), fullPage: materialsStruct(name: "Gold Coin", icon: Image("Gold_Coin_icon"), weight: 0, buyPrice: 0, sellPrice: 0, sources: ["Pals", "Trading"])))
            .environmentObject(MaterialsListManager())
    }
}

