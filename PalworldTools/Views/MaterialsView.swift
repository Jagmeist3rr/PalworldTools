//
//  MaterialsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/10/24.
//

import Foundation
import SwiftUI

struct DetailView: View{
    @EnvironmentObject var materialsListManger: MaterialsListManager//

    var item: materialsList
    var body: some View{
        VStack{
            Text(item.name)
            item.image
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
