//
//  PalsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/14/24.
//

import Foundation
import SwiftUI

struct PalsView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var palsManager: PalsManager
    var item: Pals
    
    var body: some View {
        VStack {
            HStack {
                item.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack {
                    Text(item.name)
                        .font(.title)
                    Text(item.title)
                        .opacity(0.5)
                    
                }
                Text(item.number)
            }
            .padding()
            
            Divider() // Add a divider for separation
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(item.element, id: \.self) { elementName in
                        // Display each element's name
                        HStack {
                            Text(elementName)
                            let icon = palsManager.elementIcons(element: elementName)
                            
                            // Check if the icon is not equal to a default icon
                            if icon != Image("") {
                                // Display the icon
                                icon
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            } else {
                                // Display a placeholder if no icon is found
                                Image("Neutral_icon")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }

                    }
                    
                    // Other text elements outside the ForEach loop
                    Text("Buy Price:")
                    Text("Sell Price:")
                    Text("How to Obtain:")
                }
                .padding()
                VStack{
                    Text("Text")
                }
            }
            
            Spacer() // Add spacer to push content to the top
        }
        .navigationBarTitle("", displayMode: .inline) // Clear the navigation bar title
    }
}

struct PalsView_Previews: PreviewProvider {
    static var previews: some View {
        let palsManager = PalsManager(palsManager: [])
        let item = Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: [], partnerSkill: "Fluffy Shield", worksuitabilty: ["Handiwork": 1])
        
        return PalsView(item: item)
            .environmentObject(palsManager)
    }
}
