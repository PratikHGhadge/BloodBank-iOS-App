//
//  LoginView.swift
//  BloodBank
//
//  Created by Pratik Ghadge on 17/08/25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject private var vm = AuthViewModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Select your role:")
                .font(.headline)
            Picker("Role", selection: $vm.role) {
                ForEach(Role.allCases) { role in
                    Text(role.rawValue).tag(role)
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Email", text: $vm.email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
            SecureField("Password", text: $vm.password)
                .textFieldStyle(.roundedBorder)
            
            if vm.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    vm.login(router: router)
                }
            }
            
            if let error = vm.errorMessage {
                Text(error)
            }
            
            HStack(spacing: 4) {
                Text("Not registerd yet ?")
                    .font(.body)
                
                Button("Register!") {
                    router.reset(to: .register)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

