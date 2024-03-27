//
//  SkillView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/14/24.
//

import Foundation
import SwiftUI

struct SkillView: View {
    init() {
        let red = CGFloat(143) / 255.0 // Red component
        let green = CGFloat(141) / 255.0 // Green component
        let blue = CGFloat(166) / 255.0 // Blue component
        let alpha = CGFloat(0.0) // Alpha component (1.0 for fully opaque)

        let tabBarColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        UITabBar.appearance().backgroundColor = tabBarColor
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6").edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: PalSkills()) {
                                Text("Pal Skills")
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
                            
                                Text("Coming Soon, Active Skill")
                                .frame(width: 80, height: 80) // Set the desired width and height
                        
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        .padding(.trailing,50)

                    }
                    .foregroundColor(.black)
                    .padding(.top, 100)
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
            
                                Text("Rideable Pals")
                                    .frame(width: 80, height: 80) // Set the desired width and height

                        }
                        .buttonStyle(BorderedButtonStyle())
                        .padding(.leading,40)
                        .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        Spacer()
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            
                                Text("Coming Soon, Breeding")
                                .frame(width: 80, height: 80) // Set the desired width and height
                        
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .scaleEffect(1.5) // Adjust the scale factor as needed to make the button larger
                        .padding(.trailing,50)

                    }
                    .foregroundColor(.black)
                    .padding(.top, 100)
                    Spacer()
                }
            }
            .navigationTitle("Skills")

        }

    }
}

struct SkillView_Preview: PreviewProvider {
    static var previews: some View {
        SkillView()
            .environmentObject(SkillsManager())
    }
}
