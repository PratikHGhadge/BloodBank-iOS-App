//
//  DonorTabs.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 18/08/25.
//

import Foundation
import SwiftUI

enum DonorTabs: String, CaseIterable, Identifiable {
    case organisation
    case donation

    var id: String { rawValue }

    var title: String {
        switch self {
        case .organisation: return "Organisation"
        case .donation: return "Donation"
        }
    }

    var icon: String {
        switch self {
        case .organisation: return "archivebox.fill"
        case .donation: return "drop.fill"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .organisation: Text("OrganisationView")
        case .donation: Text("DonationView")
        }
    }
}
