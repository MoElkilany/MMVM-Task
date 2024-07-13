//
//  Repo.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import Combine

protocol GiveawayRepo {
    func fetchAllGiveaways() -> AnyPublisher<[Giveaway], Error>
    func fetchGiveawaysByPlatform(platform: String) -> AnyPublisher<[Giveaway], Error>
}

class GiveawayRepositoryImpl: GiveawayRepo {
    private let service: GiveawayService
    
    init(service: GiveawayService) {
        self.service = service
    }
    
    func fetchAllGiveaways() -> AnyPublisher<[Giveaway], Error> {
        return service.fetchGiveaways()
    }
    
    func fetchGiveawaysByPlatform(platform: String) -> AnyPublisher<[Giveaway], Error> {
        return service.fetchGiveawaysByPlatform(By: platform)
    }
}



