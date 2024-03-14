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
            HStack() {
                item.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(item.name)
                Text(item.number)
            }
            .padding()
            
            Divider() // Add a divider for separation
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(item.element, id: \.self) { elementName in

                        Text(elementName) // Display each element's name

                    }
                    Text("Buy Price:")
                    Text("Sell Price:")
                    Text("How to Obtain:")
                }
                .padding()
                Spacer()
                VStack{
                    Text("Test")
                }
                .padding()
            }

            Spacer() // Add spacer to push content to the top
        }
        .navigationBarTitle("", displayMode: .inline) // Clear the navigation bar title
    }
}

struct PalsView_Previews: PreviewProvider {
    static var previews: some View {
        PalsView(item: Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: [], partnerSkill: "Fluffy Shield", worksuitabilty: [workSuitability(name: "Handiwork", icon: Image("Handiwork_icon"), level: 1)]))
    }
}

