//
//  Inventory.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 19/08/25.
//

import Foundation

enum BloodGroup: String, CaseIterable, Identifiable {
    case aPositive = "A+"
    case aNegative = "A-"
    case bPositive = "B+"
    case bNegative = "B-"
    case oPositive = "O+"
    case oNegative = "O-"
    case abPositive = "AB+"
    case obNegative = "AB-"

    var id: Self { self }
}

enum InventoryType: String, CaseIterable, Identifiable {
    case typeIn = "in"
    case typeOut = "out"

    var id: Self { self }
}

struct Inventory: Identifiable {
    let id = UUID()
    let bloodGroup: BloodGroup
    let type: InventoryType
    let quantity: Int
    let donorEmail: String
    let date: Date
}
