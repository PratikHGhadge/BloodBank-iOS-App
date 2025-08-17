//
//  ContentView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 12/08/25.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var router: Router
    @State private var isLoading = true
    private let authService = AuthService.shared
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("🩸 Blood Bank")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .scaleEffect(1.5)
            
            Spacer()
            
            Text("Loading...")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 40)
        }
        .onAppear() {
            checkAuth()
        }
    }
    
    private func checkAuth() {
        authService.getCurrentUser { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let authResponse):
                    switch authResponse.user?.role {
                    case "donor":
                        router.reset(to: .donorDashboard)
                    case "hospital":
                        router.reset(to: .hospitalDashboard)
                    case "organisation":
                        router.reset(to: .organisationDashboard)
                    case "admin":
                        router.reset(to: .adminDashboard)
                    default:
                        router.reset(to: .register)
                    }
                case .failure:
                    router.reset(to: .login)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
