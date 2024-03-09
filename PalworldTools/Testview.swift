//
//  Testview.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import Foundation
import SwiftUI

class SkillsManager: ObservableObject {
    @Published var palSkills: [Skill] = [
        Skill(name: "Artisan", rank: 1, description: "Work Speed +50%", attack: nil, defense: nil, movement: nil, workSpeed: 50, sanityDrain: nil, hungerDrain: nil),
        Skill(name: "Work Slave", rank: 1, description: "Work Speed +30%, Attack -30%", attack: -30, defense: nil, movement: nil, workSpeed: 30, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Serious", rank: 2, description: "", attack: nil, defense: nil, movement: nil, workSpeed: 20, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Lucky", rank: 3, description: "", attack: 15, defense: nil, movement: nil, workSpeed: 15, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Conceited", rank: 1, description: "", attack: nil, defense: -10, movement: nil, workSpeed: 10, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Hooligan", rank: 1, description: "", attack: 15, defense: nil, movement: nil, workSpeed: -10, sanityDrain: nil, hungerDrain: nil),
        //Skill(name: "Clumsy", rank: -1, description: "", attack: nil, defense: nil, movement: nil, workSpeed: -10, sanityDrain: nil, hungerDrain: nil)
        
    ]
}

struct PalSkills: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var skillsManager: SkillsManager // Inject SkillsManager

    
    var body: some View {
        VStack {
            // Access palSkills from skillsManager
            List(skillsManager.palSkills, id: \.name) { skill in
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        Text(skill.name)
                            .font(.headline)
                        Text("Rank: \(skill.rank)")
                        

                    }
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            if let attack = skill.attack {
                                Text("Attack:")
                                Text("\(attack)%")
                            }
                        }
                        HStack{
                            if let defense = skill.defense {
                                Text("Defense:")
                                Text("\(defense)%")
                            }
                        }
                        HStack{
                            if let movement = skill.movement{
                                Text("Movement:")
                                Text("\(movement)%")
                            }
                        }
                        HStack{
                            if let workspeed = skill.workSpeed{
                                Text("Work Speed:")
                                Text("\(workspeed)%")
                            }
                        }
                        HStack{
                            if let sanityDrain = skill.sanityDrain{
                                Text("Sanity Drain:")
                                Text("\(sanityDrain)%")
                            }
                        }
                        HStack{
                            if let hungerDrain = skill.hungerDrain{
                                Text("Hunger Drain:")
                                Text("\(hungerDrain)%")
                            }
                        }
                        
                    }
                    .font(.callout)
                    
                }
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
