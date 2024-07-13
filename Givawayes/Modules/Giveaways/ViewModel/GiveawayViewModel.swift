//
//  GiveawayViewModel.swift
//  Givawayes
//
//  Created by Elkilany on 09/07/2024.
//

import Combine
import Foundation

class GiveawayViewModel: ObservableObject {
    
    @Published var epicGamesStore: [Giveaway] = []
    @Published var giveawaysList: [Giveaway] = []
    @Published var filteredGiveaways: [Giveaway] = []
    @Published var isLoading: Bool = false
    @Published var epicGamesStoreErrorMessage: String?
    @Published var giveawaysErrorMessage: String?
    
    private var cancellable = Set<AnyCancellable>()
    
    
    func fetchGiveaways() {
        isLoading = true
        giveawaysErrorMessage = nil
        GivawayesUseCases.fetchGiveaways.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Error fetching giveaways: \(error)")
                    self.giveawaysErrorMessage = "Error fetching Giveaways: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] giveaways in
                self?.giveawaysList = giveaways
                self?.filteredGiveaways = giveaways
            })
            .store(in: &cancellable)
    }
    
    func filterGiveaways(byPlatform platform: String) {
        if platform == "All" {
            self.filteredGiveaways = giveawaysList
        } else {
            self.filteredGiveaways = giveawaysList.filter { $0.platforms?.contains(platform) ?? false }
        }
    }
    
    func fetchGiveawaysEpicGamesStore() {
        isLoading = true
        epicGamesStoreErrorMessage = nil
        GivawayesUseCases.fetchGiveawaysByPlatform.execute(platform: Constants.epicGamesStore.rawValue)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Error fetching giveaways: \(error)")
                    self.epicGamesStoreErrorMessage = "\(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] epicGamesStore in
                self?.epicGamesStore = epicGamesStore
            })
            .store(in: &cancellable)
    }
}
