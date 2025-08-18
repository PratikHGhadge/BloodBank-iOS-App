//
//  OrganisationMenu.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 18/08/25.
//

import Foundation

import SwiftUI

enum OrganisationTabs: CaseIterable, Identifiable {
    case inventory
    case donor
    case hospital
    case analytics

    var id: Self { self }

    var title: String {
        switch self {
        case .inventory: return "Inventory"
        case .donor: return "Donor"
        case .hospital: return "Hospital"
        case .analytics: return "Analytics"
        }
    }

    var icon: String {
        switch self {
        case .inventory: return "archivebox.fill"
        case .donor: return "person.fill"
        case .hospital: return "cross.case.fill"
        case .analytics: return "chart.bar.fill"
        }
    }

    @ViewBuilder
    var destination: some View {
        // TODO: Update text view with actual view later
        switch self {
        case .inventory:
            Text("inventory")
        case .donor:
            Text("donor")
        case .hospital:
            Text("hospital")
        case .analytics:
            Text("analytics")
        }
    }
}

