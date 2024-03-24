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
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                HStack{
                    //Hstack for element array and drop array
                    VStack {
                        //VStack for elementarray and icon
                        Text("Elements: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ForEach(item.element, id: \.self) { elementName in
                            HStack {
                                //Displays element names and icons in a list
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
                                Text(elementName)
                                    .frame(maxWidth: .infinity, alignment: .leading)

 
                            }
                        }
                    }
                    .frame(height: 150, alignment: .top)
                    .padding(.leading)
                    Spacer()
                    VStack {
                        Text("Drops:")
                            .frame(maxWidth: .infinity, alignment: .leading)

                        //Vstack for drops array
                        ForEach(item.drops, id: \.self) { materialName in
                            NavigationLink(destination: MatsByNameView(materialName: materialName)) {
                                HStack {
                                    Text(materialName)
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .padding(.vertical, 1)
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
                    HStack{
                        Text("\(item.partnerSkillDescription)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.leading)
                    }
                    Spacer()
                    
                }
                .frame(height: 100)
                Divider()
                test_view(item: item)
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
    //@State private var textColor = Color.white // Initial color
    var item: Pals
    @EnvironmentObject var palsManager: PalsManager

    var body: some View {


        VStack {
            HStack {
                Text("Work Suitability")
                    .frame(maxWidth: .infinity)
                .padding(.bottom)
            }
            HStack {
                VStack(alignment: .leading){
                    HStack{
                        Image("Kindling_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Kindling")
                        Text("\(palsManager.numberForElement(workname: "Kindling", worklist: item.worksuitabilty))")

                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Kindling", worklist: item.worksuitabilty))
                    HStack{
                        Image("Planting_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Planting")
                        Text("\(palsManager.numberForElement(workname: "Planting", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Planting", worklist: item.worksuitabilty))
                    HStack{
                        Image("Handiwork_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Handiwork")
                        Text("\(palsManager.numberForElement(workname: "Handiwork", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Handiwork", worklist: item.worksuitabilty))
                    HStack{
                        Image("Lumbering_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Lumbering")
                        Text("\(palsManager.numberForElement(workname: "Lumbering", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Lumbering", worklist: item.worksuitabilty))
                    HStack{
                        Image("Medicine_Production_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Medicine")
                        Text("\(palsManager.numberForElement(workname: "Medicine Production", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Medicine Production", worklist: item.worksuitabilty))
                    HStack{
                        Image("Transporting_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Transporting")
                        Text("\(palsManager.numberForElement(workname: "Transporting", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Transporting", worklist: item.worksuitabilty))
                }
                .padding(.leading)
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        Image("Watering_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Watering")
                        Text("\(palsManager.numberForElement(workname: "Watering", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Watering", worklist: item.worksuitabilty))
                    
                    HStack{
                        Image("Generating_Electricity_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Electricity")
                        Text("\(palsManager.numberForElement(workname: "Generate Electricty", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Generate Electricity", worklist: item.worksuitabilty))
                    HStack{
                        Image("Gathering_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Gathering")
                        Text("\(palsManager.numberForElement(workname: "Gathering", worklist: item.worksuitabilty))")
                            .padding(.trailing, 60)

                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Gathering", worklist: item.worksuitabilty))
                    HStack{
                        Image("Mining_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Mining")
                        Text("\(palsManager.numberForElement(workname: "Mining", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Mining", worklist: item.worksuitabilty))
                    HStack{
                        Image("Cooling_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Cooling")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Cooling", worklist: item.worksuitabilty))
                    HStack{
                        Image("Farming_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Farming")
                        Text("\(palsManager.numberForElement(workname: "Farming", worklist: item.worksuitabilty))")
                    }
                    .foregroundStyle(palsManager.colorForElement(workname: "Farming", worklist: item.worksuitabilty))
                }

            }
            .font(.body)
        }
    }
}

struct PalsView_Previews: PreviewProvider {
    static var previews: some View {
        let palsManager = PalsManager(palsManager: [])
        let item = Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral", "Fire"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: [], partnerSkill: "Fluffy Shield", partnerSkillDescription: "When activated, equips to the player and becomes a shield. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Handiwork": 1])
        
        let item2 = Pals(name: "Foxparks", icon: Image("Foxparks"), title: "Revealer of Paths", number: "#005", element: ["Fire", "Water"], drops: ["Leather", "Flame Organ"], food: 2, foodimage: [], partnerSkill: "Huggy Fire", partnerSkillDescription: "When activated, leaps into the player's head and uses a submachine gun to follows up player attacks.",worksuitabilty: ["Kindling": 1])
        return PalsView(item: item)
            .environmentObject(palsManager)
    }
}
