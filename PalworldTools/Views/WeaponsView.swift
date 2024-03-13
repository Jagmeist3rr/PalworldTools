//
//  WeaponsView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/11/24.
//

import Foundation
import SwiftUI

struct WeaponsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            Text("Weapons View")
            }
    }
}

struct Weapons_Previews: PreviewProvider {
    static var previews: some View {
        WeaponsView()
    }
}
