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
    @StateObject var palsManager = PalsManager(palsManager: [])
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#8f8da6")
                  .edgesIgnoringSafeArea(.all)
                VStack {
                    List(palsManager.palsManager, id: \.self) {
                        pals in
                        HStack {
                            Image("\(pals.name)")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Spacer()
                        }
                        .listRowBackground(Color.white)

                        HStack {
                            Text("\(pals.number)")
                            NavigationLink("\(pals.name)", destination: PalsView(item: pals))

                        }
                        .listRowBackground(Color(red: 196/255, green: 195/255, blue: 212/255))
                        .frame(width: 330, height: 20)
                    }
                    .cornerRadius(25)
                }

            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitle("Pals", displayMode: .inline)
        }
    }
}

struct Effigy_Previews: PreviewProvider {
    static var previews: some View {
        PalsList()
            .environmentObject(PalsManager(palsManager: []))
    }
}
