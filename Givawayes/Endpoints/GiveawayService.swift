//
//  GiveawayService.swift
//  Givawayes
//
//  Created by Elkilany on 12/07/2024.
//

import Combine
import Moya
import Foundation

class GiveawayService {
    private let provider = MoyaProvider<GiveawayAPI>()
    
    func fetchGiveaways() -> AnyPublisher<[Giveaway], Error> {
        return Future { promise in
            self.provider.request(.getAllGiveaways) { result in
                switch result {
                case .success(let response):
                    do {
                        let giveaways = try JSONDecoder().decode([Giveaway].self, from: response.data)
                        promise(.success(giveaways))
                    } catch let error {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchGiveawaysByPlatform(By platform :String) -> AnyPublisher<[Giveaway], Error> {
        
        let target = GiveawayAPI.getGiveawaysByPlatform(platform: platform)
        return Future { promise in
            self.provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let giveawaysByPlatform = try JSONDecoder().decode([Giveaway].self, from: response.data)
                        promise(.success(giveawaysByPlatform))
                    } catch let error {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}



