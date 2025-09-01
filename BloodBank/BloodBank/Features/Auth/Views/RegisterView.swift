import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var router: Router
    @StateObject private var vm = AuthViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Register as:")
                    .font(.headline)
                
                Picker("Role", selection: $vm.role) {
                    ForEach(Role.allCases) { role in
                        Text(role.rawValue.capitalized).tag(role)
                    }
                }
                .pickerStyle(.segmented)
                
                // Common fields
                TextField("Email", text: $vm.email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $vm.password)
                    .textFieldStyle(.roundedBorder)
                
                // Role-specific fields
                if vm.role == .organisation {
                    TextField("Organisation Name", text: $vm.organisationName)
                        .textFieldStyle(.roundedBorder)
                } else if vm.role == .donor || vm.role == .admin {
                    TextField("Name", text: $vm.name)
                        .textFieldStyle(.roundedBorder)
                } else if vm.role == .hospital {
                    TextField("Hospital Name", text: $vm.hospitalName)
                        .textFieldStyle(.roundedBorder)
                }
                
                TextField("Website", text: $vm.website)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Address", text: $vm.address)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Phone", text: $vm.phone)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.phonePad)
                
                if vm.isLoading {
                    ProgressView()
                } else {
                    Button("Register") {
                        vm.register(router: router)
                    }
                }
                
                if let error = vm.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
            }
            HStack(spacing: 4) {
                Text("Already User Please")
                    .font(.body)
                
                Button("Login!") {
                    router.reset(to: .login)
                }
            }
            .padding(.top, 20)
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

