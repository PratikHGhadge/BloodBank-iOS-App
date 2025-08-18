//
//  OrganisationDashboardView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//

import Foundation
import SwiftUI

struct OrganisationDashboardView: View {
    @State private var selectedTab: OrganisationTabs = .inventory

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(OrganisationTabs.allCases) { menu in
                menu.destination.tabItem {
                    Label(menu.title, systemImage: menu.icon)
                }
            }
        }
    }
}

struct OrganisationDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        OrganisationDashboardView()
    }
}
