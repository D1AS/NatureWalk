import Foundation

class UserManager: ObservableObject {
    @Published var isRememberMeEnabled: Bool = false
    @Published var loggedInUser: User? {
        didSet {
            objectWillChange.send()  // Forces the interface to update
        }
    }
    
    private let rememberMeKey = "rememberMe"
    private let lastLoggedInUserKey = "lastLoggedInUser"
    private let passwordKeyPrefix = "password_"
    
    // Predefined list of users
    private let users: [User] = [
        User(email: "test@gmail.com", password: "test123"),
        User(email: "admin@apple.com", password: "111111"),
        User(email: "user01@apple.com", password: "111111"),
        User(email: "user02@apple.com", password: "111111")
    ]
    
    init() {
        loadUserSettings()
    }
    
    var lastLoggedInUser: String? {
        return UserDefaults.standard.string(forKey: lastLoggedInUserKey)
    }
    
    // Toggles the "Remember Me" option
    func toggleRememberMe(_ value: Bool) {
        print("Remember Me updated to: \(value)")
        isRememberMeEnabled = value
        UserDefaults.standard.set(value, forKey: rememberMeKey)
    }
    
    // Sets the logged-in user and saves if "Remember Me" is enabled
    func setLoggedInUser(_ email: String?, password: String) {
        print("Logged-in user updated to: \(email ?? "None")")
        loggedInUser = users.first { $0.email == email }
        
        if let email = email {
            print("Saving last user \(email) in UserDefaults")
            UserDefaults.standard.set(email, forKey: lastLoggedInUserKey)
            UserDefaults.standard.set(password, forKey: passwordKeyPrefix + email)
        } else {
            print("Removing last user from UserDefaults")
            UserDefaults.standard.removeObject(forKey: lastLoggedInUserKey)
        }
    }
    
    // Loads the saved user settings when the app opens
    func loadUserSettings() {
        isRememberMeEnabled = UserDefaults.standard.bool(forKey: rememberMeKey)
        if isRememberMeEnabled, let lastUserEmail = lastLoggedInUser {
            loggedInUser = users.first { $0.email == lastUserEmail }
        }
        
        print("Settings loaded: Remember Me: \(isRememberMeEnabled), Last User: \(loggedInUser?.email ?? "None")")
    }
    
    // Logs out the user and resets everything
    func logout() {
        print("Logout performed, removing saved user")
        if let email = loggedInUser?.email {
            UserDefaults.standard.removeObject(forKey: passwordKeyPrefix + email)
        }
        loggedInUser = nil
        UserDefaults.standard.removeObject(forKey: lastLoggedInUserKey)
    }
    
    // Returns the saved password for a specific user
    func savedPassword(for email: String) -> String? {
        return UserDefaults.standard.string(forKey: passwordKeyPrefix + email)
    }
    
    // Validates the user's credentials
    func validateUser(email: String, password: String) -> Bool {
        return users.contains { $0.email == email && $0.password == password }
    }
}
