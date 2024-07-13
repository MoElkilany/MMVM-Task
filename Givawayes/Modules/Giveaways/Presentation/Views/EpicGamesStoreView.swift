//
//  EpicGamesStoreView.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI

struct EpicGamesStoreView: View {
    let giveaways: [Giveaway]

    var body: some View {
        if !giveaways.isEmpty {
            CarouselView(items: giveaways) { giveaway in
                CarouselRow(giveaway: giveaway)
            }
        } else {
            Text("No giveaways available.")
        }
    }
}
