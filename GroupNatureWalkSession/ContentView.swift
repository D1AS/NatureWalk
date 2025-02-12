import SwiftUI

struct ContentView: View {
    @StateObject private var sessionStore = LoadSession()
    @StateObject private var favoritesManager = FavoritesManager()
    
    @State private var isLoggedIn = false
    @State private var username: String = ""

    var body: some View {
        // Apply environmentObject to the entire view
        VStack {
            if isLoggedIn {
                TabView {
                    NavigationView {
                        SessionsListView(username: username)
                    }
                    .tabItem {
                        Label("Sessions", systemImage: "list.bullet")
                    }

                    NavigationView {
                        FavoritesListView(username: username)
                    }
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }

                    NavigationView {
                        Button("Log Out") {
                            isLoggedIn = false
                            username = "" // Clear username on log out
                        }
                        .foregroundColor(.red)
                        .navigationTitle("Log Out")
                    }
                    .tabItem {
                        Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                }
            } else {
                LoginView(isLoggedIn: $isLoggedIn, username: $username)
            }
        }
        .environmentObject(sessionStore)  // Moved out of the Group
        .environmentObject(favoritesManager)
    }
}
