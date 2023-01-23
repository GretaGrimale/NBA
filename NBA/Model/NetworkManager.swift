//
//  NetworkManager.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-18.
//

import Foundation
class NetworkManager: ObservableObject{
    @Published var resultsTeams = [Team]()
    @Published var resultsPlayers = [Player]()
    @Published var resultsGames = [Game]()
    
    func fetchData(_ urlP: String) {
        if let url = URL(string: urlP){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        
                        do{
                            if urlP == "https://www.balldontlie.io/api/v1/teams" {
                                let results = try decoder.decode(ResultsT.self, from: safeData)
                                DispatchQueue.main.async {
                                    
                                    self.resultsTeams = results.data
                                }
                            }
                            if urlP.contains("https://www.balldontlie.io/api/v1/players") {
                                let results = try decoder.decode(ResultsP.self, from: safeData)
                                DispatchQueue.main.async {
                                    
                                    self.resultsPlayers = results.data
                                    
                                }
                            }
                            if urlP.contains("https://www.balldontlie.io/api/v1/games?&team_ids[]=") {
                                let results = try decoder.decode(ResultsG.self, from: safeData)
                                DispatchQueue.main.async {
                                    
                                    self.resultsGames.append(contentsOf: results.data)
                                    
                                }
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    func shouldLoadData(id: Int) -> Bool{
        return id == resultsGames.count - 2
    }
    func findTheTitle(teamId: (Int)) -> String {
        
        
        let indexOfArrayFiltered = resultsTeams.filter{$0.id == teamId}
        
        var fullName = "testing"
        if indexOfArrayFiltered.isEmpty {
            fullName = "Team"
        } else {
            let indexFiltered = indexOfArrayFiltered[0]
            
            fullName = indexFiltered.full_name
        }
        return fullName
        
    }
}
