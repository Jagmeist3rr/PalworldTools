//
//  PalSphereView.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/27/24.
//

import SwiftUI

struct PalSphereView: View {
    
    var palsphere: PalSpheres
    
    init(palsphere: PalSpheres) {
        self.palsphere = palsphere
    }
    
    var body: some View {

        Text("Hello, Sphere")
        Text("\(palsphere.baseItem.name)")
    }
}

struct PalSphereView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePalSphere = PalSpheres(baseItem: materialsStruct(name: "Pal Sphere", icon: Image("Pal Sphere"), weight: 0.1, buyPrice: 120, sellPrice: 12, sources: [], itemDescription: "An item that captures Pals when thrown. Mass produced, it is only effective on low level Pals."), capturePower: 7, techLevel: 2, pointCost: 1, workLoad: 3, materials: ["Paldium Fragment":1, "Wood":3, "Stone":3])
        return PalSphereView(palsphere: samplePalSphere)
    }
}
