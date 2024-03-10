//
//  Materials.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/9/24.
//

import Foundation
import SwiftUI

struct materialsStruct{
    var name:String
    var icon: Image
    var weight: Int
    var buyPrice: Int
    var sellPrice: Int
    var sources: String
}

class MaterialsManager: ObservableObject{
    @Published var matslist: [materialsStruct] = []
    
}
