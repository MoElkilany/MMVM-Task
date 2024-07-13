//
//  FavoritesManager.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import Foundation

class FavoritesManager {
    
    // MARK: - The class uses the Singleton pattern to ensure there's only one instance of FavoritesManager throughout the application
    static let shared = FavoritesManager()
   
 // MARK: - Private init() {} makes the initializer private, preventing the creation of additional instances of FavoritesManager
    
    private init() {}
    
    private func getFavorites() -> [Int] {
        return UserDefaults.standard.array(forKey: Constants.favoriteKey.rawValue) as? [Int] ?? []
    }
    
    func saveFavorite(id: Int) {
        var favorites = getFavorites()
        if !favorites.contains(id) {
            favorites.append(id)
        }
        UserDefaults.standard.set(favorites, forKey: Constants.favoriteKey.rawValue)
    }
    
    func removeFavorite(id: Int) {
        var favorites = getFavorites()
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
        }
        UserDefaults.standard.set(favorites, forKey: Constants.favoriteKey.rawValue)
    }
    
    
    func isFavorite(id: Int) -> Bool {
        return getFavorites().contains(id)
    }
}
