//
//  AppState.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 13/08/25.
//

import SwiftUI

// Singleton class
final class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var currentUser: User? = nil
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = true
    
    let tokenKey = "authToken"
    
    private init() {}
    
    func saveUser(_ user: User, token: String) {
        self.currentUser = user
        self.isAuthenticated = true
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func logOut() {
        self.currentUser = nil
        self.isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
