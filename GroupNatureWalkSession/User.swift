import Foundation

class User: Identifiable, Codable {
    let id = UUID()
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
