import Foundation

struct NatureWalkSessions {
    let sessions: [NatureWalkSession]
    
    init() {
        self.sessions = NatureWalkSessions.loadSessions()
    }

    private static func loadSessions() -> [NatureWalkSession] {
        
        [
            NatureWalkSession(name: "Coastal Cliff Walk",
                              description: "Experience stunning ocean views along rugged coastal cliffs",
                              starRating: 4.7,
                              hostName: "Seaside Trekkers",
                              phoneNumber: "777-888-9999",
                              photos: ["cliff1", "cliff2"],
                              pricePerPerson: 30.0),
            
            NatureWalkSession(name: "Desert Oasis Discovery",
                              description: "Explore a hidden desert oasis and learn about unique flora",
                              starRating: 4.3,
                              hostName: "Arid Adventures",
                              phoneNumber: "444-555-6666",
                              photos: ["oasis1", "oasis2"],
                              pricePerPerson: 40.0),
            
            NatureWalkSession(name: "Rainforest Canopy Tour",
                              description: "Journey through the upper layers of a lush rainforest",
                              starRating: 4.9,
                              hostName: "Treetop Explorers",
                              phoneNumber: "111-222-3333",
                              photos: ["canopy1", "canopy2"],
                              pricePerPerson: 50.0)
        ]
    }

}
