//
//  EffigyTool.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import Foundation
import SwiftUI

struct PalsList: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var palsManager: PalsManager
    
    var body: some View {
        ZStack {
            Color(red: 196/255, green: 195/255, blue: 212/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                List(palsManager.palsManager, id: \.self) {
                    pals in
                    HStack {
                        Image("Lamball")
                            .resizable()
                        .frame(width: 50, height: 50)
                        Spacer()
                    }
                    HStack {
                        Text("\(pals.number)")
                        Text("\(pals.name)")
                    }
                    .listRowBackground(Color(red: 196/255, green: 195/255, blue: 212/255))
                }
            }


        }
        
    }
    
}

struct Effigy_Previews: PreviewProvider {
    static var previews: some View {
        PalsList(palsManager: PalsManager(palsManager: []))
    }
}
