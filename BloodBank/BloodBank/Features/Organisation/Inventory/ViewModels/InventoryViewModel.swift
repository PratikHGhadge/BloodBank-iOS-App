//
//  InventoryViewModel.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 19/08/25.
//

import Foundation

class InventoryViewModel: ObservableObject {
    @Published var records: [Inventory] = [
        Inventory(bloodGroup: .bNegative, type: .typeIn, quantity: 28, donorEmail: "pratikhg.2001@gmail.com", date: Date()),
        Inventory(bloodGroup: .aPositive, type: .typeIn, quantity: 28, donorEmail: "pratikhg.2001@gmail.com", date: Date()),
        Inventory(bloodGroup: .oPositive, type: .typeIn, quantity: 17, donorEmail: "pratikhg.2001@gmail.com", date: Date())
    ]

    func addRecords(_ record: Inventory) {
        records.append(record)
    }
}
