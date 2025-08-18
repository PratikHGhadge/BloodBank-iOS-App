//
//  HospitalDashboardView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//

import Foundation
import SwiftUI

struct HospitalDashboardView: View {
    @State private var selectedTab: HospitalTabs = .organisation

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(HospitalTabs.allCases) { menu in
                menu.destination.tabItem {
                    Label(menu.title, systemImage: menu.icon)
                }
            }
        }
    }
}

struct HospitalDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalDashboardView()
    }
}
