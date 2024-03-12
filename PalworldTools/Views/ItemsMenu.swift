//
//  ItemsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/10/24.
//

import Foundation
import SwiftUI

struct ItemsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            VStack {
                NavigationLink("Bulding Scructures", destination: BuildingView())
                NavigationLink("Materials", destination: MaterialsView())
                
            }
        }
        
}

struct Items_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
            .environmentObject(MaterialsListManager())
            .environmentObject(MaterialsManager())
            .environmentObject(SkillsManager())
    }
}

