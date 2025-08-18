//
//  DonorDashboardView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//



import Foundation
import SwiftUI

struct DonorDashboardView: View {
    @State private var selectedTab: DonorTabs = .organisation

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(DonorTabs.allCases) { menu in
                menu.destination.tabItem {
                    Label(menu.title, systemImage: menu.icon)
                }
            }
        }
    }
}

struct DonorDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DonorDashboardView()
    }
}
