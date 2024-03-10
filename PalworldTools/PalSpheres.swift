//
//  PalSpheres.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/9/24.
//

import Foundation
import SwiftUI
import UIKit

struct sphereMats{
    var amount: Int
    var item: String
    var itemImage: Image
}

struct palSphereType{
    var sphereName: String
    var rarity: String
    var weight: Float
    var capturePower: Int
    var tierUnlock: Int
    var pointCost: Int
    var workLoad: Int
    var buyPrice: Int
    var sellPrice: Int
    var mats: sphereMats
    var description: String
}

class PalSpheresManager: ObservableObject{
    @Published var sphereManager: [palSphereType] = []
}
