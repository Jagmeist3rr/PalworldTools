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
        VStack {
            Text("Test")
            TabView{
                PalSkills()
                    .tag(0)
                    .foregroundColor(.black)
                    .tabItem {
                        Image(systemName: "wrench.and.screwdriver.fill")
                        Text("Passive Skills")
                    }
                
            }
        }
    }
}

struct SkillView_Preview: PreviewProvider {
    static var previews: some View {
        SkillView()
            .environmentObject(SkillsManager())
    }
}
