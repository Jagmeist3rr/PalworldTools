//
//  MaterialsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/10/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @EnvironmentObject var materialsListManager: MaterialsListManager
    @Environment(\.presentationMode) var presentationMode

    
    var item: materialsList
    
    var body: some View {
        let roundedweight = String(format: "%.2f", item.fullPage.weight)
        
        HStack{
            item.image
                .resizable()
                .frame(width: 50,height: 50)
                //.frame(maxWidth: .infinity, alignment: .leading)
            Text(item.name)
        }
        .frame(width: 300, height: 50, alignment: .center)
        .offset(CGSize(width: 0, height: 0))
        
        VStack{
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Weight:")
                    Spacer()
                    Text(roundedweight)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Buy Price:")
                    Spacer()

                    Text("\(item.fullPage.buyPrice)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Sell Price:")
                    Spacer()
                    Text("\(item.fullPage.sellPrice)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: 120, height: 70)
            //.offset(CGSize(width: -10, height: -40))
            .font(.system(size: 15))

            VStack{
                Text("How to obtain:")

                ScrollView(.vertical) {
                    ForEach(item.fullPage.sources, id: \.self) { item in
                        Text(item)
                    }
                }
                .frame(height: 60) // Fixed height for the list

            }
            .frame(width: 150, height: 125)
            .font(.system(size: 15))

        }
    }
}





struct MaterialsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var materialsManager: MaterialsManager // Inject MaterialsManager
    @EnvironmentObject var materialsListManger: MaterialsListManager//
    @State private var selectedItem: materialsList? // Track selected item
    @State private var isDetailViewActive = false // Control navigation
    @State private var isShowingPopup = false
    
    var body: some View {
        ZStack {
            VStack {
                    List(materialsListManger.matslistmanstruct, id: \.name) { material in
                        Button(action: {
                            self.selectedItem = material
                            self.isDetailViewActive = true
                            isShowingPopup = true
                        }) {
                            HStack {
                                material.image
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text(material.name)
                            }
                        }
                    }
                }
            // Popup view
            if isShowingPopup {
                GeometryReader { geometry in
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isShowingPopup = false
                        }
                    
                    VStack {
                        
                        DetailView(item: selectedItem!)

                    }
                    
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                    .background(Color.white)
                    .cornerRadius(15)
                    .offset(x: geometry.size.height * 0.05, y: geometry.size.height * 0.25)
                }
                
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
