//
//  MockGiveawayRepository.swift
//  GivawayesTests
//
//  Created by Elkilany on 12/07/2024.
//

import Combine
@testable import Givawayes

class MockGiveawayRepository: GiveawayRepo {
    var fetchAllGiveawaysResult: Result<[Giveaway], Error>?
    var fetchGiveawaysByPlatformResult: Result<[Giveaway], Error>?

    func fetchAllGiveaways() -> AnyPublisher<[Giveaway], Error> {
        return fetchAllGiveawaysResult!.publisher.eraseToAnyPublisher()
    }

    func fetchGiveawaysByPlatform(platform: String) -> AnyPublisher<[Giveaway], Error> {
        return fetchGiveawaysByPlatformResult!.publisher.eraseToAnyPublisher()
    }
}
