//
//  AuthViewModel.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    // Common fields
    @Published var name = ""
    @Published var address = ""
    @Published var phone = ""
    @Published var website = ""
    @Published var cratedAt = ""
    @Published var updatedAt = ""
    @Published var role: Role = .donor
    @Published var email = ""
    @Published var password = ""
    
    // Organisation fields
    @Published var organisationName = ""
    
    // Hospital fields
    @Published var hospitalName = ""
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func login() {
        isLoading = true
        AuthService.shared.login(
            email: email,
            password: password,
            role: role) { result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .success(let response):
                        if let user = response.user, let token = response.token {
                            AppState.shared.saveUser(user, token: token)
                        } else {
                            self.errorMessage = response.message ?? "Login failed"
                        }
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
    }
    
    func register() {
        isLoading = true
        AuthService.shared.register(
            email: email,
            password: password,
            name: name,
            hospitalName: hospitalName,
            organisationName: organisationName,
            website: website,
            address: address,
            phone: phone,
            role: role) { result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .success(let response):
                        if let user = response.user, let token = response.token {
                            AppState.shared.saveUser(user, token: token)
                        } else {
                            self.errorMessage = response.message ?? "Registration failed"
                        }
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
    }
}
