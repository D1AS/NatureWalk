import Foundation

class FavoritesManager: ObservableObject {
    @Published var favoriteSessions: [NatureWalkSession] = []
    private var username: String = ""

    // Updates the user and loads their favorites
    func setUser(_ username: String) {
        self.username = username
        print("Loading favorites for user: \(username)")
        loadFavorites()
    }

    // Toggles the favorite state of a session
    func toggleFavorite(session: NatureWalkSession) {
        if let index = favoriteSessions.firstIndex(where: { $0.id == session.id }) {
            print("Removing session from favorites: \(session.name)")
            favoriteSessions.remove(at: index)
        } else {
            print("Adding session to favorites: \(session.name)")
            favoriteSessions.append(session)
        }
        saveFavorites()
    }

    // Checks if a session is a favorite
    func isFavorite(session: NatureWalkSession) -> Bool {
        return favoriteSessions.contains { $0.id == session.id }
    }

    // Remove favorite
    func removeFavorite(at offsets: IndexSet) {
        print("Remove favorite for user: \(username)")
        favoriteSessions.remove(atOffsets: offsets)
        saveFavorites()
    }
    
    // Removes all favorites
    func removeAllFavorites() {
        print("Removing all favorites for user: \(username)")
        favoriteSessions.removeAll()
        saveFavorites()
    }

    // Generates the unique key to save the user's favorites
    private func favoritesKey() -> String {
        return "favoriteSessions_\(username)"
    }

    // Saves the current user's favorites to UserDefaults
    private func saveFavorites() {
        guard !username.isEmpty else {
            print("Error saving favorites: username is empty")
            return
        }
        do {
            let encoded = try JSONEncoder().encode(favoriteSessions)
            UserDefaults.standard.set(encoded, forKey: favoritesKey())
            print("Favorites saved for \(username)")
        } catch {
            print("Error saving favorites: \(error)")
        }
    }

    // Loads the current user's favorites from UserDefaults
    private func loadFavorites() {
        guard !username.isEmpty else {
            print("No favorites found: username is empty")
            favoriteSessions = []
            return
        }
        if let savedData = UserDefaults.standard.data(forKey: favoritesKey()) {
            do {
                favoriteSessions = try JSONDecoder().decode([NatureWalkSession].self, from: savedData)
                print("Favorites loaded for \(username): \(favoriteSessions.count) items")
            } catch {
                print("Error loading favorites: \(error)")
            }
        } else {
            print("No favorites found for \(username)")
            favoriteSessions = []
        }
    }
}
