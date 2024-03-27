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
                .foregroundColor(.black)
                .padding()
                
                Divider()
            ScrollView{
                HStack{
                    //Hstack for element array and drop array
                    VStack {
                        //VStack for elementarray and icon
                        Text("Elements: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        let sortedElements = item.element.sorted()

                        ForEach(sortedElements, id: \.self) { elementName in
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
                    .foregroundColor(.black)
                    .frame(height: 90, alignment: .top)
                    .padding(.leading)
                }
                Divider()
                VStack {
                    Text("Drops:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    let sortedDrops = item.drops.sorted()

                    //Vstack for drops array
                    ForEach(sortedDrops, id: \.self) { materialName in
                        NavigationLink(destination: MatsByNameView(materialName: materialName)) {
                            HStack {
                                Text(materialName)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.vertical, 1)
                    }
                    .buttonStyle(BorderedButtonStyle())

                }
                .foregroundColor(.black)
                .padding(.leading)
                .padding(.trailing)
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
                .foregroundColor(.black)
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
                .foregroundColor(.black)
            }
            HStack {
                VStack(alignment: .leading){
                    HStack{
                        Image("Kindling_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Kindling")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Kindling", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Kindling", worklist: item.worksuitabilty))
                    HStack{
                        Image("Planting_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Planting")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Planting", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Planting", worklist: item.worksuitabilty))
                    HStack{
                        Image("Handiwork_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Handiwork")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Handiwork", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Handiwork", worklist: item.worksuitabilty))
                    
                    HStack{
                        Image("Lumbering_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Lumbering")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Lumbering", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Lumbering", worklist: item.worksuitabilty))
                    HStack{
                        Image("Medicine_Production_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Medicine")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Medicine Production", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Medicine Production", worklist: item.worksuitabilty))
                    HStack{
                        Image("Transporting_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Transporting")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Transporting", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
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
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Watering", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Watering", worklist: item.worksuitabilty))
                    HStack{
                        Image("Generating_Electricity_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Electricity")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Generate Electricty", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Generate Electricity", worklist: item.worksuitabilty))
                    HStack{
                        Image("Gathering_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Gathering")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Gathering", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Gathering", worklist: item.worksuitabilty))
                    HStack{
                        Image("Mining_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Mining")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Mining", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Mining", worklist: item.worksuitabilty))
                    HStack{
                        Image("Cooling_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Cooling")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Mining", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(palsManager.colorForElement(workname: "Cooling", worklist: item.worksuitabilty))
                    HStack{
                        Image("Farming_Icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Farming")
                        Spacer()
                        Text("\(palsManager.numberForElement(workname: "Farming", worklist: item.worksuitabilty))")
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
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
        let item = Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: [], partnerSkill: "Fluffy Shield", partnerSkillDescription: "When activated, equips to the player and becomes a shield. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Handiwork": 1])
        
        let item2 = Pals(name: "Jetragon", icon: Image("Jetragon"), title: "Legendary Celestial Dragon", number: "#111", element: ["Dragon"], drops: ["Pure Quartz","Polymer","Carbon Fiber","Diamond"], food: 9, foodimage: [], partnerSkill: "Aerial Missle", partnerSkillDescription: "Can be ridden as a flying mount. Can rapidly fire a missile launcher while mounted.", worksuitabilty: ["Gathering":3])
        return PalsView(item: item2)
            .environmentObject(palsManager)
    }
}
