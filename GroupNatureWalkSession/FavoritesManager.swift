//
//  FavoritesManager.swift
//  GroupNatureWalkSession
//
//  Created by Henrique Machitte on 09/02/25.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favoriteSessions: [NatureWalkSession] = []
    
    private let favoritesKey = "favoriteSessions"

        init() {
            loadFavorites()
        }
    
    /// Alterna o estado de favorito de uma sessão
    func toggleFavorite(session: NatureWalkSession) {
        if let index = favoriteSessions.firstIndex(where: { $0.id == session.id }) {
            // Se já está favoritado, remove
            favoriteSessions.remove(at: index)
        } else {
            // Se não está favoritado, adiciona
            favoriteSessions.append(session)
        }
        saveFavorites() // Chamar manualmente o salvamento
    }
    
    /// Verifica se uma sessão está nos favoritos
    func isFavorite(session: NatureWalkSession) -> Bool {
        return favoriteSessions.contains { $0.id == session.id }
    }
    
    /// Remove todos os favoritos
    func removeAllFavorites() {
        favoriteSessions.removeAll()
        saveFavorites() // Salvar após limpar
    }
    
    /// Salva os favoritos no UserDefaults
        func saveFavorites() {
            do {
                let encoded = try JSONEncoder().encode(favoriteSessions)
                UserDefaults.standard.set(encoded, forKey: favoritesKey)
            } catch {
                print("Erro ao salvar favoritos: \(error)")
            }
        }

        /// Carrega os favoritos do UserDefaults (
        func loadFavorites() {
            if let savedData = UserDefaults.standard.data(forKey: favoritesKey) {
                do {
                    favoriteSessions = try JSONDecoder().decode([NatureWalkSession].self, from: savedData)
                } catch {
                    print("Erro ao carregar favoritos: \(error)")
                }
            }
        }
}
