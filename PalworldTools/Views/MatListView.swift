//
//  MaterialsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/10/24.
//

import Foundation
import SwiftUI

struct MaterialsView: View {
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var materialsManager: MaterialsManager // Inject MaterialsManager
    @EnvironmentObject var materialsListManager: MaterialsListManager //
    @State private var selectedItem: materialsList? // Track selected item

    init() {
        let red = CGFloat(143) / 255.0 // Red component
        let green = CGFloat(141) / 255.0 // Green component
        let blue = CGFloat(166) / 255.0 // Blue component
        let alpha = CGFloat(0.0) // Alpha component (1.0 for fully opaque)

        let tabBarColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        UITabBar.appearance().backgroundColor = tabBarColor
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 143/255, green: 141/255, blue: 166/255)
                    //.frame(width: geometry.size.width, height: geometry.size.height)
                   .edgesIgnoringSafeArea(.all)

                List(materialsListManager.matslistmanstruct, id: \.self) { material in
                    NavigationLink(destination: MatsView(item: material)) {
                        HStack {
                            material.image
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(material.name)
                        }
                      
                        
                    }
                    .foregroundColor(.black)
                                        .listRowBackground(
                                            RoundedRectangle(cornerRadius: 5)
                                                .background(.clear)
                                                .foregroundColor(Color(red: 196/255, green: 195/255, blue: 212/255))
                                                .padding(
                                                    EdgeInsets(
                                                        top: 2,
                                                        leading: 10,
                                                        bottom: 10,
                                                        trailing: 10)))
                                        .listRowSeparator(.hidden)
                }
                .cornerRadius(25)
                .listStyle(.plain) // Apply PlainListStyle to remove default list style
                .navigationBarTitle("Materials")
                //.navigationBarHidden(true) // Hide default navigation bar
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
