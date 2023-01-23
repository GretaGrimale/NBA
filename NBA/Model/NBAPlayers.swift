//
//  NBAPlayers.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-18.
//

import Foundation

struct ResultsP: Decodable {
    let data: [Player]
    }
struct Player: Identifiable, Hashable, Codable {
    var first_name: String
    var last_name: String
    var id: Int
    var team: TeamStr
}

    struct TeamStr: Identifiable, Hashable, Codable {
        var full_name: String
        var id: Int
    }
