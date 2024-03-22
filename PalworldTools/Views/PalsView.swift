//
//  PalsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/14/24.
//

import Foundation
import SwiftUI

struct PalsView: View {
    @EnvironmentObject var materialsListManager: MaterialsListManager //
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
                            .frame(maxWidth: 300, alignment: .leading)
                        
                    }
                    Spacer()
                    Spacer()
                }
                .padding()
                
                Divider()
            ScrollView{

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
                    .frame(height: 150, alignment: .top)
                    .padding(.leading)
                    Spacer()
                    VStack {
                        //Vstack for drops array
                        ForEach(item.drops, id: \.self) { elementName in
                            NavigationLink(destination: MatsView(item: materialsList)){
                            HStack {
                                Text(elementName)
                                    .frame(maxWidth: 150, alignment: .leading)
                            }
                        }
                        }
                    }
                    .padding(.leading)
                    .frame(height: 150, alignment: .top)
                    Spacer()
                }
                Divider()
                HStack{
                    //Hstack will be for amount of food
                    Text("Food:")
                        .frame(alignment: .leading)
                        .padding(.leading)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                Divider()
                VStack {
                    HStack{
                        Text("Partner Skill:")
                            .padding(.leading)
                        Text("\(item.partnerSkill)")
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Text("Test")
                            .frame(alignment: .leading)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.bottom, 50)
                    Spacer()
                    
                }
                .frame(height: 100)
                Divider()
                test_view(item: item, palsManager: _palsManager)
                Spacer()
            }
        }
        .background(Color(red: 196/255, green: 195/255, blue: 212/255))
        .navigationBarTitle("", displayMode: .inline) // Clear the navigation bar title
    }
}

extension Color {
    static let workColor = Color.white
}

struct test_view: View {
    @State private var textColor = Color.white // Initial color
    var item: Pals
    @EnvironmentObject var palsManager: PalsManager
    var body: some View {


        VStack {
            HStack {
                Text("Work Suitability")
                    .frame(maxWidth: .infinity)
                .padding(.bottom)
            }
            HStack{
                Image("Kindling_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Kindling: ")
                    .foregroundStyle(textColor)
                Spacer()
                Image("Watering_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Watering: ")
                    .padding(.trailing, 85)
            }
            HStack{
                Image("Planting_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Planting: ")
                Spacer()
                Image("Generating_Electricity_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Electricity:")
                    .padding(.trailing, 83)
            }
            HStack{
                Image("Handiwork_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Handiwork: ")
                Spacer()
                Image("Gathering_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 60)
                Text("Gathering: ")
                    .padding(.trailing, 80)
                    .frame(maxWidth: .infinity)
            }
            HStack{
                Image("Lumbering_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Lumbering: ")
                Spacer()
                Image("Mining_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 5)
                Text("Mining: ")
                    .padding(.trailing, 34)
                Spacer()
            }
            .frame(maxWidth: .infinity)

            HStack{
                Image("Medicine_Production_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Medicine Production: ")
                    .padding(.trailing, 60)
                Image("Cooling_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 2)
                Text("Cooling: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing)
                
            }
            .frame(maxWidth: .infinity)
            HStack{
                Image("Transporting_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading)
                Text("Transporting: ")
                    .padding(.trailing,40)
                Image("Farming_Icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 2)
                Text("Farming: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 0)
            }
            .frame(maxWidth: .infinity)
        }
        
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
