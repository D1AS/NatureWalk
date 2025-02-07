import Foundation

class LoadSession: ObservableObject {
    @Published var sessions: [NatureWalkSession]
    
    init() {
        self.sessions = NatureWalkSessions().sessions
    }
}
