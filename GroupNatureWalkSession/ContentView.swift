import SwiftUI

struct ContentView: View {
    @StateObject private var sessionStore = LoadSession()
    @StateObject private var favoritesManager = FavoritesManager()
    

    @State private var isLoggedIn = false

    var body: some View {
   
            Group {
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
                        
                        NavigationView {
                            Button("Log Out") {
                                
                                
                                
                                isLoggedIn = false
                            }
                            .foregroundColor(.red)
                            .navigationTitle("Log Out")
                        }
                        .tabItem {
                            Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }
                else {
                    LoginView(isLoggedIn: $isLoggedIn)
                }
                
            }
        .environmentObject(sessionStore)
        .environmentObject(favoritesManager)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
