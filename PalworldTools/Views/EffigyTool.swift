//
//  EffigyTool.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/7/24.
//

import Foundation
import SwiftUI

struct EffigyTool: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(hex: "#8f8da6")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("This is the Detail View")
                    .padding()
                Image("R3pos")
                Text("Test")
                
            }


        }
        
    }
    
}

struct Effigy_Previews: PreviewProvider {
    static var previews: some View {
        EffigyTool()
    }
}
