//
//  BloodBankApp.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 12/08/25.
//

import SwiftUI

@main
struct BloodBankApp: App {
    @StateObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                LaunchView()
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .launch:
                            LaunchView()
                        case .login:
                            LoginView()
                        case .register:
                            RegisterView()
                        case .adminDashboard:
                            AdminDashboardView()
                        case .donorDashboard:
                            DonorDashboardView()
                        case .hospitalDashboard:
                            HospitalDashboardView()
                        case .organisationDashboard:
                            OrganisationDashboardView()
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
