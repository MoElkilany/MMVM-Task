//
//  FilteredGiveawaysView.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import SwiftUI

struct FilteredGiveawaysView: View {
    let giveaways: [Giveaway]

    var body: some View {
        if !giveaways.isEmpty {
            ForEach(giveaways) { item in
                NavigationLink(destination: GiveawayDetailsPage(giveaway: item)) {
                    GiveawayList(giveaway: item)
                        .padding(.bottom, 12)
                }
            }
        } else {
            Text("No filtered giveaways available.")
        }
    }
}
