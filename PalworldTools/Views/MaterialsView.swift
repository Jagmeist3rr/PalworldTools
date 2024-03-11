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
        GeometryReader { geometry in
            let roundedweight = String(format: "%.2f", item.fullPage.weight)
            
            VStack(alignment: .leading) {
                HStack {
                    item.image
                    Spacer()
                    Text(item.name)
                        .font(.title2)
                }
                Spacer()
                Text("Weight: \(roundedweight)")
                Text("Buy Price: \(item.fullPage.buyPrice)")
                Text("Sell Price: \(item.fullPage.sellPrice)")
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(width: geometry.size.width, height: geometry.size.height) // Adjust to cover entire screen
            .overlay(
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }

                , alignment: .topTrailing
            )
        }
    }
}





struct MaterialsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var materialsManager: MaterialsManager // Inject MaterialsManager
    @EnvironmentObject var materialsListManger: MaterialsListManager//
    @State private var selectedItem: materialsList? // Track selected item
    @State private var isDetailViewActive = false // Control navigation
    
    var body: some View {
            VStack {
                List(materialsListManger.matslistmanstruct, id: \.name) { material in
                    Button(action: {
                        self.selectedItem = material
                        self.isDetailViewActive = true
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
            .navigationTitle("Materials")
            .sheet(isPresented: $isDetailViewActive) {
                if let selectedItem = self.selectedItem {
                    DetailView(item: selectedItem)
                }
                else{
                    Text("Error")
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
