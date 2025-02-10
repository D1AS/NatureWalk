//
//  FavoritesView.swift
//  GroupNatureWalkSession
//
//  Created by rg on 2/6/25.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationStack {
            VStack {
                if favoritesManager.favoriteSessions.isEmpty {
                    Text("No favorites yet")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding()
                } else {
                    List {
                        ForEach(favoritesManager.favoriteSessions) { session in
                            NavigationLink {
                                SessionDetailsView(session: session)
                            } label: {
                                SessionRowView(session: session)
                            }
                        }
                        .onDelete(perform: removeFavorite)
                    }
                    .listStyle(PlainListStyle())
                }
                
                if !favoritesManager.favoriteSessions.isEmpty {
                    Button(action: removeAllFavorites) {
                        Label("Remove All", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                    .padding()
                }
            }
            .navigationTitle("Favorites")
        }
    }
    
    /// Remove um favorito da lista
    func removeFavorite(at offsets: IndexSet) {
        favoritesManager.favoriteSessions.remove(atOffsets: offsets)
    }
    
    /// Remove todos os favoritos
    func removeAllFavorites() {
        favoritesManager.removeAllFavorites()
    }
}

