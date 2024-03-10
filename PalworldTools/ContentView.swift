//
//  ContentView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink("Lifunk Capture Rates", destination: EffigyTool())
                NavigationLink("Pal Skills",destination: PalSkills())
                NavigationLink("Items", destination: ItemsView())
            }
            .navigationTitle("Palworld Tools")
        }
        
    }
}

#Preview {
    ContentView()
}
