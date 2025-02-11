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
                              photos: ["https://images.pexels.com/photos/991012/pexels-photo-991012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "https://images.pexels.com/photos/3556117/pexels-photo-3556117.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"],
                              pricePerPerson: 30.0),
            
            NatureWalkSession(name: "Desert Oasis Discovery",
                              description: "Explore a hidden desert oasis and learn about unique flora",
                              starRating: 4.3,
                              hostName: "Arid Adventures",
                              phoneNumber: "444-555-6666",
                              photos: ["https://images.pexels.com/photos/58535/pexels-photo-58535.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "https://images.pexels.com/photos/106606/pexels-photo-106606.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"],
                              pricePerPerson: 40.0),
            
            NatureWalkSession(name: "Rainforest Canopy Tour",
                              description: "Journey through the upper layers of a lush rainforest",
                              starRating: 4.9,
                              hostName: "Treetop Explorers",
                              phoneNumber: "111-222-3333",
                              photos: ["https://images.pexels.com/photos/70365/forest-sunbeams-trees-sunlight-70365.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "https://images.pexels.com/photos/975771/pexels-photo-975771.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"],
                              pricePerPerson: 50.0)
        ]
    }

}

