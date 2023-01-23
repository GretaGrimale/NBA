//
//  NBATeams.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-17.
//

import Foundation
struct ResultsT: Decodable {
    let data: [Team]
    }

struct Team: Identifiable, Hashable, Codable {
    var full_name: String
    var city: String
    var conference: String
    var id: Int
}

