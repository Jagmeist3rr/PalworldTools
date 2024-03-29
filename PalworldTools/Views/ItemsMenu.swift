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
        ZStack {
            Color(hex: "#8f8da6")
                .edgesIgnoringSafeArea(.all)
            VStack {
                    NavigationLink("Bulding Scructures", destination: defenseBuildingView())
                    NavigationLink("Materials", destination: MaterialsView())
                    
            }
            .foregroundColor(.black)
        }
        HStack{
            NavigationLink("Bulding Scructures", destination: defenseBuildingView())
            NavigationLink("Materials", destination: MaterialsView())
            Text("Test")
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

