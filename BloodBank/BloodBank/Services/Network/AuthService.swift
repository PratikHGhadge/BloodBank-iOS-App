//
//  AuthService.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 16/08/25.
//

import Foundation

enum Role: String, CaseIterable, Identifiable {
    case admin = "Admin"
    case organisation = "Organisation"
    case donor = "Donor"
    case hospital = "Hospital"
    
    var id: String {
        switch self {
        case .donor:
            return "donar"
        case .admin:
            return "admin"
        case .organisation:
            return "oraganisation"
        case .hospital:
            return "hospital"
        }
    }
}

class AuthService {
    static let shared = AuthService()
    private init() {}
    
    func login(
        email: String,
        password: String,
        role: Role,
        completion: @escaping (Result<AuthResponse, NetworkError>) -> Void
    ) {
        let body = ["email": email, "password": password, "role": role.id]
        APIClient.shared.request(
            endPoint: Endpoints.login.path,
            body: body,
            completion: completion)
    }
    
    func register(
        email: String,
        password: String,
        name: String = "",
        hospitalName: String = "",
        organisationName: String = "",
        website: String,
        address: String,
        phone: String,
        role: Role,
        completion: @escaping (Result<AuthResponse, NetworkError>) -> Void
    ) {
        let body = [
            "email": email,
            "password": password,
            "name": name,
            "hospitalName": hospitalName,
            "organisationName": organisationName,
            "website": website,
            "address": address,
            "phone": phone,
            "role": role.id]
        APIClient.shared.request(
            endPoint: Endpoints.register.path,
            body: body,
            completion: completion)
    }
    
    func getCurrentUser(_ completion: @escaping (Result<AuthResponse, NetworkError>) -> Void) {
        if let savedToken = UserDefaults.standard.string(forKey: AppState.shared.tokenKey) {
            APIClient.shared.request(
                endPoint: Endpoints.getCurrentUser.path,
                method: "GET",
                token: savedToken,
                completion: completion)
        }
    }
}
