import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var username: String
    @Binding var password: String
    @ObservedObject var userManager: UserManager 
    
    @State private var rememberMe: Bool = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Toggle("Remember Me", isOn: $rememberMe)
                .padding()
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button("Login") {
                authenticateUser()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
        }
        .padding()
        .onAppear {
            rememberMe = userManager.isRememberMeEnabled
            if rememberMe, let lastUserEmail = userManager.lastLoggedInUser {
                username = lastUserEmail
                password = userManager.savedPassword(for: lastUserEmail) ?? ""
            }
        }
    }
    
    private func authenticateUser() {
        if userManager.validateUser(email: username, password: password) {
            userManager.toggleRememberMe(rememberMe)
            userManager.setLoggedInUser(username, password: password)
            
            isLoggedIn = true
        } else {
            errorMessage = "Invalid username or password. Please try again."
            password = ""
        }
    }
}
