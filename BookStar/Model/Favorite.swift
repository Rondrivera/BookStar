//
//  Favorites.swift
//  BookStar
//
//  Created by Arpit Awasthi on 30/08/21.
//

import Foundation

struct Favorite: Codable {
    let bookID: String
    let genre: String
}

class FavoriteManager {
    static let shared = FavoriteManager()
    var favorites : [Favorite] = []
    
    init() {
        self.updateFavorites { updated, favorites in
        }
    }
    
    func updateFavorites(limit : Int? = nil, _ completed : @escaping (_ updated:Bool, _ favorites:[Favorite]) -> Void?) {
        NetworkServices.getFavorites (limit: limit) { favorites, error in
            guard let fav = favorites as? [Favorite], fav.count > 0 else {
                completed (false, self.favorites)
                return
            }
            let updated = (self.favorites.count != fav.count)
            self.favorites = fav
            completed (updated, self.favorites)
        }
    }
    
    func isFavorite(_ bookID : String) -> Bool {
        return self.favorites.filter({$0.bookID == bookID}).count > 0
    }
}
