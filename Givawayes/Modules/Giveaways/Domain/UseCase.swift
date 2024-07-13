//
//  UseCase.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import Combine


class GivawayesUseCases {
    static var fetchGiveaways = FetchGiveawaysUseCase(repository:GiveawayRepositoryImpl(service: GiveawayService()))
    static var fetchGiveawaysByPlatform = FetchGiveawaysByPlatformUseCase(repository:GiveawayRepositoryImpl(service: GiveawayService()))
}

struct FetchGiveawaysUseCase {
    private let repository: GiveawayRepo
    
    init(repository: GiveawayRepo) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Giveaway], Error> {
        return repository.fetchAllGiveaways()
    }
}

struct FetchGiveawaysByPlatformUseCase {
    private let repository: GiveawayRepo
    
    init(repository: GiveawayRepo) {
        self.repository = repository
    }
    
    func execute(platform: String) -> AnyPublisher<[Giveaway], Error> {
        return repository.fetchGiveawaysByPlatform(platform: platform)
    }
}
