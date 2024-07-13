//
//  GiveawayRowView.swift
//  Givawayes
//
//  Created by Elkilany on 09/07/2024.
//

import SwiftUI

struct GiveawayRowView: View {
    let giveaway: Giveaway
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: giveaway.image ?? ""))
                .frame(width: 100 , height: 100)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(giveaway.title ?? "" )
                    .font(.headline)
                Text(giveaway.description ?? "" )
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}
