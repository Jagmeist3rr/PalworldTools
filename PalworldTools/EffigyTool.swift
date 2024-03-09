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
        VStack {
            Text("This is the Detail View")
                .padding()
        }
        .navigationTitle("Effigy Tools")
    }
}

struct Effigy_Previews: PreviewProvider {
    static var previews: some View {
        EffigyTool()
    }
}
