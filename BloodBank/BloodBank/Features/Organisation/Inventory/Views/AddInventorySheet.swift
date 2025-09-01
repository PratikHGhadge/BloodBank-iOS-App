//
//  AddInventorySheet.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 19/08/25.
//

import Foundation
import SwiftUI

struct AddInventorySheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: InventoryViewModel

    @State private var bloodGroup: BloodGroup = .oPositive
    @State private var type: InventoryType = .typeIn
    @State private var quantity = ""
    @State private var donorEmail = ""

    var body: some View {
        NavigationView {
            Form {
                Picker("Blood group", selection: $bloodGroup) {
                    ForEach(BloodGroup.allCases) { bloodGroup in
                        Text(bloodGroup.rawValue)
                    }
                }

                Picker("Inventory Type", selection: $type) {
                    ForEach(InventoryType.allCases) { inventoryType in
                        Text(inventoryType.rawValue)
                    }
                }

                TextField("Quantity", text: $quantity)
                    .keyboardType(.numberPad)

                TextField("Donor Email", text: $donorEmail)
                    .keyboardType(.emailAddress)
            }
            .navigationTitle("Add Inventory")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let qty = Int(quantity) {
                            let newRecord = Inventory(
                                bloodGroup: bloodGroup,
                                type: type,
                                quantity: qty,
                                donorEmail: donorEmail,
                                date: Date()
                            )
                            vm.addRecords(newRecord)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
