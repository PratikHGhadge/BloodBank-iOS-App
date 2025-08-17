//
//  AuthResponse.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 16/08/25.
//

import Foundation

struct AuthResponse: Codable {
    let success: Bool
    let message: String?
    let user: User?
    let token: String?
}
