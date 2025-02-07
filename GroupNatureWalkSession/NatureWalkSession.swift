import Foundation

struct NatureWalkSession: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let starRating: Double
    let hostName: String
    let phoneNumber: String
    let photos: [String]
    let pricePerPerson: Double
    
    init(id: UUID = UUID(), name: String, description: String, starRating: Double, hostName: String, phoneNumber: String, photos: [String], pricePerPerson: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.starRating = starRating
        self.hostName = hostName
        self.phoneNumber = phoneNumber
        self.photos = photos
        self.pricePerPerson = pricePerPerson
    }
}

