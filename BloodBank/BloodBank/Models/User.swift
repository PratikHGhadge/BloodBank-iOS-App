//
//  User.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 13/08/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let role: String
    let name: String
    let organisationName: String
    let hospitalName: String
    let email: String
    let password: String
    let website: String
    let address: String
    let phone: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case role, name, organisationName, hospitalName, email, password, website, address, phone, createdAt, updatedAt
    }
}
