//
//  GiveawayDetailsPage.swift
//  Givawayes
//
//  Created by Elkilany on 09/07/2024.
//

import SwiftUI

struct GiveawayDetailsPage: View {
    
    let giveaway: Giveaway
    @State var isFav = false
    
    var body: some View {
        VStack{
            ZStack {
                AsyncImage(url: URL(string:giveaway.image ?? ""))
                    .frame( height: 200)
                
                VStack(alignment: .leading) {
                     Spacer()
                        HStack{
                            Text( giveaway.title ?? "")
                                .font(.title2)
                                .foregroundColor(.white)
                                .lineLimit(3)
                            Spacer()
                            FavoriteView(itemID: giveaway.id ?? 0, isFav: $isFav)
                            Spacer().frame(width: 12)
                            Text("Get it")
                                .font(.headline)
                                .padding(10)
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding([.top,.horizontal],40)
                    .padding(.bottom,20)
                
                .frame(height: 220)
                .background(Color.black.opacity(0.6))
            }
            
            HStack(alignment: .center, spacing: 20){
                VerticalIconWithTitle(iconName: GivawayesIconConstants.worthIconName, value: giveaway.worth ?? "" )
                Spacer()
                DividerView()
                Spacer()
                VerticalIconWithTitle(iconName: GivawayesIconConstants.usersIconName, value: String(giveaway.users ?? 0 ))
                Spacer()
                DividerView()
                Spacer()
                VerticalIconWithTitle(iconName: GivawayesIconConstants.typeIconName, value: giveaway.type ?? "" )
            }
            .padding(.horizontal,20)
            
            VStack(alignment: .leading,spacing:15) {
                VerticalTitleWithDescription(title: "Platforms", description: giveaway.platforms ?? "" )
                VerticalTitleWithDescription(title: "Giveaway End Date", description:giveaway.endDate?.GivawayesFormattedDate() ?? "-" )
                VerticalTitleWithDescription(title: "Description", description: giveaway.description ?? "" )
            }
            .padding(.horizontal)
            Spacer()
        }
        .ignoresSafeArea()
        
        .onAppear {
            isFav = FavoritesManager.shared.isFavorite(id: giveaway.id ?? 0)
        }
    }
}





