//
//  ContentView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Lifunk Capture Rates", destination: EffigyTool())
                NavigationLink("Pal Skills",destination: PalSkills())
                NavigationLink("Items", destination: ItemsView())
            }
            .navigationTitle("Palworld Tools")
            .foregroundColor(.black)
        }
        .background(Color(red: 0.5, green: 0.7, blue: 0.3)) // Custom color with RGB values
        .edgesIgnoringSafeArea(.all) // Apply to ignore safe area
    }
}



#Preview {
    ContentView()
        .environmentObject(MaterialsListManager())
        .environmentObject(MaterialsManager())
        .environmentObject(SkillsManager())

}
