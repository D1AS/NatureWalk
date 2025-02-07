import SwiftUI

struct ContentView: View {
    @StateObject private var sessionStore = LoadSession()
//    @StateObject private var favoritesManager = FavoritesManager()
//    @StateObject private var userManager = UserManager()
    

//    @State private var isLoggedIn = false
    @State private var isLoggedIn = true

    var body: some View {
   
            Group {
                if isLoggedIn {
                    TabView {
                        NavigationStack {
                            SessionsListView()
                        }
                        .tabItem {
                            Label("Sessions", systemImage: "list.bullet")
                        }
                        
                        NavigationStack {
                            FavoritesListView()
                        }
                        .tabItem {
                            Label("Favorites", systemImage: "heart.fill")
                        }
                        
                        NavigationStack {
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
//        .environmentObject(favoritesManager)
//        .environmentObject(userManager)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
