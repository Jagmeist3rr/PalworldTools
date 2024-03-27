//
//  PalSphereView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/27/24.
//

import SwiftUI

struct PalSphereListView: View {
    var body: some View {
        
         let palSphereList: [PalSpheres] = [
            PalSpheres(baseItem: materialsStruct(name: "Pal Sphere", icon: Image("Pal Sphere"), weight: 0.1, buyPrice: 120, sellPrice: 12, sources: [], itemDescription: "An item that captures Pals when thrown. Mass produced, it is only effective on low level Pals."), capturePower: 7, techLevel: 2, pointCost: 1, workLoad: 3, materials: ["Paldium Fragment":1, "Wood":3, "Stone":3])
        ]
            ZStack {
                Color(hex: "#8f8da6").edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack{
                        HStack{
                            Button(action: {
                                // Action to perform when the button is tapped
                            }) {
                                NavigationLink(destination: PalSphereView(palsphere: palSphereList[0])) {
                                    Text("Pal Sphere")
                                        .frame(width: 80, height: 80) // Set the desired width and height
                                }
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(.leading,40)
                            .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                            Spacer()
                            Button(action: {
                                // Action to perform when the button is tapped
                            }) {
                                NavigationLink(destination: PalSphereView(palsphere: palSphereList[0])) {
                                    Text("Mega Sphere")
                                        .frame(width: 80, height: 80) // Set the desired width and height
                                }
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(.trailing,40)
                            .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        }
                        .foregroundColor(.black)
                        .padding(.top, 50)
                        HStack{
                            Button(action: {
                                // Action to perform when the button is tapped
                            }) {
                                NavigationLink(destination: PalSphereView(palsphere: palSphereList[0])) {
                                    Text("Giga Sphere")
                                        .frame(width: 80, height: 80) // Set the desired width and height
                                }
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(.leading,40)
                            .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                            Spacer()
                            Button(action: {
                                // Action to perform when the button is tapped
                            }) {
                                NavigationLink(destination: PalSphereView(palsphere: palSphereList[0])) {
                                    Text("Hyper Sphere")
                                        .frame(width: 80, height: 80) // Set the desired width and height
                                }
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(.trailing,40)
                            .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        }
                        .foregroundColor(.black)
                        .padding(.top, 50)
                        HStack{
                            Button(action: {
                                // Action to perform when the button is tapped
                            }) {
                                NavigationLink(destination: PalSphereView(palsphere: palSphereList[0])) {
                                    Text("Ultra Sphere")
                                        .frame(width: 80, height: 80) // Set the desired width and height
                                }
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(.leading,40)
                            .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                            Spacer()
                            Button(action: {
                                // Action to perform when the button is tapped
                            }) {
                                NavigationLink(destination: PalSphereView(palsphere: palSphereList[0])) {
                                    Text("Legendary Sphere")
                                        .frame(width: 80, height: 80) // Set the desired width and height
                                }
                            }
                            .buttonStyle(BorderedButtonStyle())
                            .padding(.trailing,40)
                            .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        }
                        .foregroundColor(.black)
                        .padding(.top, 50)
                        Spacer()

                    }

                }

            }

        }
    
}

#Preview {
    PalSphereListView()
}
