//
//  FavoriteView.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI

struct FavoriteView: View {
    var itemID = 0
    @Binding var isFav: Bool

    var body: some View {
        Button {
            isFav.toggle()
            if isFav {
                FavoritesManager.shared.saveFavorite(id: itemID)
            } else {
                FavoritesManager.shared.removeFavorite(id:itemID)
            }
        } label: {
            Image(systemName: isFav ? GivawayesIconConstants.heartFillIconName : GivawayesIconConstants.heartIconName)
                .resizable()
                .foregroundColor(isFav ? .red : .white)
                .frame(width: 25, height: 25)
        }
    }
}
