//
//  GiveawaysPage.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//


import SwiftUI
import Moya
import Combine

struct GiveawaysPage: View {
    
    @StateObject var viewModel = GiveawayViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        if viewModel.isLoading {
                            LoadingView()
                        } else if let errorMessage = viewModel.epicGamesStoreErrorMessage {
                            ErrorView(errorMessage: errorMessage)
                        } else {
                            EpicGamesStoreView(giveaways: viewModel.epicGamesStore)
                        }
                    }
                    .frame(height: 250)

                    Spacer()

                    ChoosePlateform(onSelectPlateform: { plateform in
                        viewModel.filterGiveaways(byPlatform: plateform)
                    })
                    Spacer()
                    if viewModel.isLoading {
                        LoadingView()
                    } else if let errorMessage = viewModel.giveawaysErrorMessage {
                        ErrorView(errorMessage: errorMessage)
                    } else {
                        FilteredGiveawaysView(giveaways: viewModel.filteredGiveaways)
                    }
                }
            }
            .navigationTitle("Game Giveaways")
          
            .task {
                loadRequests()
            }
        }
    }
}


extension GiveawaysPage {
    private func loadRequests() {
        if viewModel.epicGamesStore.isEmpty {
            viewModel.fetchGiveawaysEpicGamesStore()
        }

        if viewModel.giveawaysList.isEmpty {
            viewModel.fetchGiveaways()
        }
    }
}









