//
//  GiveawayModel.swift
//  Givawayes
//
//  Created by Elkilany on 09/07/2024.
//

import Foundation


struct Giveaway: Identifiable, Decodable {
    var id: Int?
    var title, worth: String?
    var thumbnail, image: String?
    var description, instructions: String?
    var openGiveawayURL: String?
    var publishedDate: String?
    var type: String?
    var platforms, endDate: String?
    var users: Int?
    var status: String?
    var gamerpowerURL, openGiveaway: String?

    enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image, description, instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case type, platforms
        case endDate = "end_date"
        case users, status
        case gamerpowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}
