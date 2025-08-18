//
//  HospitalTabs.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 18/08/25.
//

import Foundation
import SwiftUI

enum HospitalTabs: String, CaseIterable, Identifiable {
    case organisation
    case consumer

    var id: String { rawValue }

    var title: String {
        switch self {
        case .organisation: return "Organisation"
        case .consumer: return "Consumer"
        }
    }

    var icon: String {
        switch self {
        case .organisation: return "archivebox.fill"
        case .consumer: return "person.3.fill"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .organisation:
            Text("OrganisationView")
        case .consumer:
            Text("ConsumerView")
        }
    }
}
