//
//  NBAGames.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-18.
//

import Foundation

struct ResultsG: Decodable {
    let data: [Game]
    
    }

struct Game: Identifiable, Hashable, Codable {
   var home_team: HomeTeam
    var home_team_score: Int
    var visitor_team: VisitorTeam
    var visitor_team_score: Int
    var id: UUID {return UUID()}
}

struct HomeTeam: Identifiable, Hashable, Codable {
    var full_name: String
    var id: Int
    
}
struct VisitorTeam: Identifiable, Hashable, Codable {
    var full_name: String
    var id: Int
}
