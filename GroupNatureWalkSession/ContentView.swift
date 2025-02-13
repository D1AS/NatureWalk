import SwiftUI

struct ContentView: View {
    @StateObject private var sessionStore = NatureWalkSessions()
    @StateObject private var favoritesManager = FavoritesManager()
    @StateObject private var userManager = UserManager()
    
    @State private var isLoggedIn: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showLogoutAlert: Bool = false

    var body: some View {
        VStack {
            if isLoggedIn {
                TabView {
                    NavigationView {
                        SessionsListView()
                    }
                    .tabItem {
                        Label("Sessions", systemImage: "list.bullet")
                    }

                    NavigationView {
                        FavoritesListView()
                    }
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }

                    Text("Log Out")
                        .foregroundColor(.red)
                        .onTapGesture {
                            showLogoutAlert = true
                        }
                        .tabItem {
                            Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                        }
                        .alert(isPresented: $showLogoutAlert) {
                            Alert(
                                title: Text("Confirm Logout"),
                                message: Text("Are you sure you want to log out?"),
                                primaryButton: .destructive(Text("Log Out")) {
                                    logoutUser()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                }
            } else {
                LoginView(isLoggedIn: $isLoggedIn, username: $username, password: $password, userManager: userManager)
            }
        }
        .onAppear {
            print("App loaded, checking Remember Me...")
            if userManager.isRememberMeEnabled, let lastUserEmail = userManager.lastLoggedInUser {
                print("Last saved user detected: \(lastUserEmail), filling in login fields")
                username = lastUserEmail
                password = userManager.savedPassword(for: lastUserEmail) ?? ""
            } else {
                print("No saved user, going to login screen")
                isLoggedIn = false
            }
        }
        .onReceive(userManager.$loggedInUser) { newUser in
            print("User change detected: \(newUser?.email ?? "None")")
            if let user = newUser {
                username = user.email
                favoritesManager.setUser(user.email)
            } else {
                isLoggedIn = false
                username = ""
                password = ""
                favoritesManager.setUser("")
            }
        }
        .environmentObject(sessionStore)
        .environmentObject(favoritesManager)
    }

    private func logoutUser() {
        print("User \(username) logged out")
        userManager.logout()
        favoritesManager.setUser("")
        isLoggedIn = false
    }
}
