//
//  APIClient.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 16/08/25.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case badRequest
    case noData
}

enum Endpoints {
    // Authentication endpoints
    case login
    case register
    case getCurrentUser

    var path: String {
        switch self {
        case .login:
            return "/api/v1/auth/login"
        case .register:
            return "/api/v1/auth/register"
        case .getCurrentUser:
            return "/api/v1/auth/currentuser"
        }
    }
}

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    private let baseURL: URL = URL(string: "https://bloodbankwebapp.onrender.com")!
    
    func request<T: Decodable>(
        endPoint: String,
        method: String = "POST",
        body: [String: Any]? = nil,
        token: String? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: endPoint, relativeTo: baseURL) else {
            completion(.failure(.badUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        // TODO: clean up these logs later
        print("➡️ URL:", request.url?.absoluteString ?? "nil")
        print("➡️ Method:", request.httpMethod ?? "nil")
        print("➡️ Headers:", request.allHTTPHeaderFields ?? [:])
        if let body = request.httpBody {
            print("➡️ Body:", String(data: body, encoding: .utf8) ?? "nil")
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                    print("📡 Status code:", httpResponse.statusCode)
                    print("📑 Headers:", httpResponse.allHeaderFields)
                }

            if let data = data {
                let rawString = String(data: data, encoding: .utf8)
                print("📦 Raw Response:", rawString ?? "nil")
            }

            if error != nil {
                completion(.failure(NetworkError.badRequest))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
}
