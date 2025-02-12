import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username: String = UserDefaults.standard.string(forKey: "savedUsername") ?? ""
    @State private var password: String = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
    @State private var rememberMe: Bool = UserDefaults.standard.bool(forKey: "rememberMe")
    @State private var errorMessage: String?

    // List of valid usernames and passwords
    private let validUsers: [String: String] = [
        "admin@apple.com": "111111",
        "user1@apple.com": "111111",
        "user2@apple.com": "111111"
    ]

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
                if let correctPassword = validUsers[username], correctPassword == password {
                    // Save credentials if "Remember Me" is checked
                    if rememberMe {
                        UserDefaults.standard.set(username, forKey: "savedUsername")
                        UserDefaults.standard.set(password, forKey: "savedPassword")
                        UserDefaults.standard.set(true, forKey: "rememberMe")
                    } else {
                        UserDefaults.standard.removeObject(forKey: "savedUsername")
                        UserDefaults.standard.removeObject(forKey: "savedPassword")
                        UserDefaults.standard.set(false, forKey: "rememberMe")
                    }
                    isLoggedIn = true
                } else {
                    // Show error message for incorrect credentials
                    errorMessage = "Invalid username or password. Please try again."
                    password = "" // Clear password field for re-entry
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
        }
        .padding()
    }
}
