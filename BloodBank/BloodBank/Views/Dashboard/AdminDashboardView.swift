//
//  AdminDashboardView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//

import Foundation
import SwiftUI

struct AdminDashboardView: View {
    @State private var selectedTab: AdminTabs = .donorList

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(AdminTabs.allCases) { menu in
                menu.destination.tabItem {
                    Label(menu.title, systemImage: menu.icon)
                }
            }
        }
    }
}

struct AdminDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        AdminDashboardView()
    }
}


