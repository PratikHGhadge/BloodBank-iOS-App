//
//  InventoryView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 19/08/25.
//

import Foundation
import SwiftUI

struct InventoryView: View {
    @StateObject private var vm = InventoryViewModel()
    @State private var showAddSheet = false

    var body: some View {
        VStack {
            // Title & Add Button
            HStack {
                Text("All Blood Records")
                    .font(.title2)
                    .bold()
                Spacer()
                Button("+ Add Inventory") {
                    showAddSheet = true
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()

            // Table/List
            List {
                HStack {
                    Text("Blood Group").bold()
                    Spacer()
                    Text("Type").bold()
                    Spacer()
                    Text("Qty").bold()
                    Spacer()
                    Text("Donor Email").bold()
                    Spacer()
                    Text("Date").bold()
                }

                ForEach(vm.records) { record in
                    HStack {
                        Text(record.bloodGroup.rawValue)
                        Spacer()
                        Text(record.type.rawValue)
                        Spacer()
                        Text("\(record.quantity)")
                        Spacer()
                        Text(record.donorEmail)
                        Spacer()
                        Text(record.date.formatted(date: .abbreviated, time: .shortened))
                    }
                }
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddInventorySheet(vm: vm)
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}
