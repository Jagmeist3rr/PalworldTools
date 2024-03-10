//
//  Testview.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import Foundation
import SwiftUI



let labelWidth = ["Attack:", "Defense:", "Movement:", "Work Speed: ", "Sanity Drain:", "Hunger Drain"].map { $0.count}.max()! * 8

struct PalSkills: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var skillsManager: SkillsManager // Inject SkillsManager

    
    var body: some View {
        VStack {
            // Access palSkills from skillsManager
            
            List(skillsManager.palSkills, id: \.name) { skill in
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        HStack{
                            Text(skill.name)
                                .font(.headline)
                            skill.rank
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }
                        if let description = skill.description{
                            Text(description)
                                .font(.system(size: 15))
                                .frame(width: 200,alignment: .leading)
                        }

                    }
                    .frame(width: 150,alignment: .leading)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            if let attack = skill.attack {
                                Text("Attack:")
                                    .frame(width: 60,alignment: .leading)
                                Text("\(attack)%")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        HStack{
                            if let defense = skill.defense {
                                Text("Defense:")
                                    .frame(width: 70,alignment: .leading)
                                Text("\(defense)%")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        HStack{
                            if let movement = skill.movement {
                                Text("Movement:")
                                    .frame(width: 85,alignment: .leading)
                                Text("\(movement)%")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        HStack{
                            if let workSpeed = skill.workSpeed {
                                Text("Work Speed:")
                                    .frame(width: CGFloat   (labelWidth),alignment: .leading)
                                    .frame(width: 75,alignment: .leading)
                                Text("\(workSpeed)%")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        HStack{
                            if let sanityDrain = skill.sanityDrain {
                                Text("Sanity Drain:")
                                    .frame(width: CGFloat   (labelWidth),alignment: .leading)
                                    .frame(width: 85,alignment: .leading)
                                Text("\(sanityDrain)%")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        HStack{
                            if let hungerDrain = skill.hungerDrain {
                                Text("Hunger Drain:")
                                    .frame(width: CGFloat   (labelWidth),alignment: .leading)
                                    .frame(width: 87,alignment: .leading)
                                Text("\(hungerDrain)%")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 14))
                    
                }
                .frame(height: 70)
            }
            
            .padding()
        }
        .navigationTitle("Pal Skills")
    }
}

struct PalSkills_Previews: PreviewProvider {
    static var previews: some View {
        PalSkills()
            .environmentObject(SkillsManager())
    }
}
