import Foundation


class NatureWalkSession: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var starRating: Double
    var hostName: String
    var phoneNumber: String
    var photos: [String]
    var pricePerPerson: Double

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
