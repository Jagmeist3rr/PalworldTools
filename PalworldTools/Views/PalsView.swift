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
                //HStack for Image, name, and number
                item.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack {
                    Text(item.name)
                        .font(.title)
                        .frame(maxWidth: 200, alignment: .leading)
                    //Text(item.title)
                    Text("\(item.number)  \(item.title)")
                        .opacity(0.5)
                        .frame(maxWidth: 200, alignment: .leading)
                    
                }
                Spacer()
                Spacer()
            }
            .padding()
            
            Divider()
            
            HStack {
                //Elements and drops hstack
                Text("Elements:")
                    .frame(alignment: .top)
                    .padding(.leading)
                Spacer()
                Text("Drops:")
                    .frame(alignment: .top)
                    .padding(.trailing, 140)

                }
            HStack{
                //Hstack for element array and drop array
                VStack {
                    //VStack for elementarray and icon
                    ForEach(item.element, id: \.self) { elementName in
                        HStack {
                            //Displays element names and icons in a list
                                Text(elementName)
                                    .frame(maxWidth: 100, alignment: .leading)
                                    
                                let icon = palsManager.elementIcons(element: elementName)
                                if icon != Image("") {
                                    icon
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                } else {
                                    Image("Neutral_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                        }
                    }
                }
                .frame(height: 200, alignment: .top)
                .padding(.leading)
                Spacer()
                VStack {
                    //Vstack for drops array
                    ForEach(item.drops, id: \.self) { elementName in
                        HStack {
                                Text(elementName)
                                    .frame(maxWidth: 150, alignment: .leading)
                        }

                    }
                }
                .padding(.leading)
                .frame(height: 200, alignment: .top)
                Spacer()
            }
            HStack{
                //Hstack will be for amount of food
                Text("Test")
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            Spacer()
        }
        .background(Color(red: 196/255, green: 195/255, blue: 212/255))
        .navigationBarTitle("", displayMode: .inline) // Clear the navigation bar title
    }
}

struct PalsView_Previews: PreviewProvider {
    static var previews: some View {
        let palsManager = PalsManager(palsManager: [])
        let item = Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral", "Fire"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: [], partnerSkill: "Fluffy Shield", worksuitabilty: ["Handiwork": 1])
        
        let item2 = Pals(name: "Foxparks", icon: Image("Foxparks"), title: "Revealer of Paths", number: "#005", element: ["Fire", "Water"], drops: ["Leather", "Flame Organ"], food: 2, foodimage: [], partnerSkill: "Huggy Fire", worksuitabilty: ["Kindling": 1])
        return PalsView(item: item)
            .environmentObject(palsManager)
    }
}
