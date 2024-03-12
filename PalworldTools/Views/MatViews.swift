//
//  ItemViews.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/11/24.
//

import Foundation
import SwiftUI

struct ItemsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var materialsListManager: MaterialsListManager
    
    var body: some View {
            VStack {
                Text("Test")
                NavigationLink("Materials", destination: MaterialsView())
                
            }
            .navigationTitle("Items")
        }
        
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
            .environmentObject(MaterialsListManager())
    }
}

