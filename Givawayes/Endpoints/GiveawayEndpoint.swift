//
//  GiveawayEndpoint.swift
//  Givawayes
//
//  Created by Elkilany on 09/07/2024.
//

import Foundation
import Moya
import Combine

enum GiveawayAPI {
    case getAllGiveaways
    case getGiveawaysByPlatform(platform: String)
}

extension GiveawayAPI: TargetType {
    var baseURL: URL { URL(string: Constants.baseURL.rawValue)! }
    
    var path: String {
        switch self {
        case .getAllGiveaways:
            return Constants.giveaways.rawValue
        case .getGiveawaysByPlatform:
            return Constants.giveaways.rawValue
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
            switch self {
            case .getAllGiveaways:
                return .requestPlain
            case .getGiveawaysByPlatform(let platform):
                return .requestParameters(parameters: [Constants.platform.rawValue: platform], encoding: URLEncoding.queryString)
            }
        }
    
    var fullURL: String {
        return baseURL.appendingPathComponent(path).absoluteString
    }
    
    var headers: [String : String]? {
        return [Constants.contentType.rawValue: Constants.applicationJson.rawValue]
    }
}

