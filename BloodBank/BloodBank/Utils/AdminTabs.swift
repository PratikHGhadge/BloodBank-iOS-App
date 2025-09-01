//
//  AdminTabs.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 18/08/25.
//

import Foundation
import SwiftUI

enum AdminTabs: String, CaseIterable, Identifiable {
    case donorList
    case hospitalList
    case organisationList

    var id: String { rawValue }

    var title: String {
        switch self {
        case .donorList: return "Donor List"
        case .hospitalList: return "Hospital List"
        case .organisationList: return "Organisation List"
        }
    }

    var icon: String {
        switch self {
        case .donorList: return "person.2.fill"
        case .hospitalList: return "cross.case.fill"
        case .organisationList: return "building.2.fill"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .donorList: Text("DonorListView")
        case .hospitalList: Text("HospitalListView")
        case .organisationList: Text("OrganisationListView")
        }
    }
}
