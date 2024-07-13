//
//  GiveawayList.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI


struct GiveawayList: View {
    let giveaway: Giveaway
    @State var isFav: Bool = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string:giveaway.image ?? ""))
                .frame(width: 350 , height: 200)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                HStack{
                    
                    Text (giveaway.title ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .lineLimit(3)
                    Spacer()
                    FavoriteView(itemID: giveaway.id ?? 0, isFav: $isFav )
                }
                Text( giveaway.platforms ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(3)
                Spacer()
                Text( giveaway.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(3)
            }
            .padding()
            .frame(width: 350 , height: 200)
            .background(Color.black.opacity(0.6))
            .cornerRadius(20)
        }
        .onAppear {
            isFav = FavoritesManager.shared.isFavorite(id: giveaway.id ?? 0)
        }
    }
}



