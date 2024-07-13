//
//  PlatformsEnum.swift
//  Givawayes
//
//  Created by Elkilany on 11/07/2024.
//

import Foundation

enum Platforms: String, CaseIterable {
    case all = "all"
    case pc = "pc"
    case steam = "steam"
    case ios = "ios"
    case android = "android"
    
    var filteredName: String {
        switch self {
        case .all: return "All"
        case .pc: return "PC"
        case .steam: return "Steam"
        case .ios: return "iOS"
        case .android: return "Android"
        }
    }
}
