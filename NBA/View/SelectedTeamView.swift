//
//  SelectedTeamView.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-18.
//

import SwiftUI


struct SelectedTeamView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var selectedTeam: Int?
    @State private var url = "https://www.balldontlie.io/api/v1/games?&team_ids[]="
    @State private var urlForTitle = "https://www.balldontlie.io/api/v1/teams"
    @State private var page = 1
    @State private var number: Int?
 
    var body: some View {
        NavigationStack{
            ZStack{
            VStack{
                List{
                    Section{
                        HStack{
                            
                            Text("Home \nName")
                            Spacer()
                            Text("Home \nScore")
                            Spacer()
                            Text("Visitor \nName")
                            Spacer()
                            Text("Visitor \nScore")
                        }
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .font(Font.headline.weight(.bold))
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    
                                        Text(networkManager.findTheTitle(teamId: selectedTeam ?? 1)  ).font(.title2)
                                    
                                }
                            }
                        }
                    }
                    Section{
                        
                        ForEach(networkManager.resultsGames){game in
                            HStack{
                                Text(game.home_team.full_name.replacingOccurrences(of: " ", with: "\n"))
                                Spacer()
                                Text(String(game.home_team_score))
                                Spacer()
                                Text(game.visitor_team.full_name.replacingOccurrences(of: " ", with: "\n"))
                                Spacer()
                                Text(String(game.visitor_team_score))
                                Spacer()
                                Text(String(networkManager.resultsGames.firstIndex(of: game) ?? 300003))
                            }
                            .listRowSeparatorTint(.white)
                            
                            .onAppear(perform: {
                               
                                if networkManager.resultsGames.firstIndex(of: game) == nil {
                                    number = 1
                                } else {
                                    number = networkManager.resultsGames.firstIndex(of: game)! + 1
                                }
                                
                                
                                if networkManager.shouldLoadData(id: number!){
                                    page += 1
                                    networkManager.fetchData("\(url)\(selectedTeam!)&page=\(page)")
                                }
                            }
                            )
                            
                        }
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    
                                    Text(networkManager.findTheTitle(teamId: selectedTeam ?? 1)  ).font(.title2)
                                    
                                }
                            }
                        }
                        
                    }
                }
                //.toolbarBackground(.hidden)
                
                .scrollContentBackground(.hidden)
                .listStyle(.automatic)
                .toolbarBackground(Color.blue, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar )
                //.navigationTitle(networkManager.findTheTitle(teamId: selectedTeam ?? 1))
               
            }
          
            
        }
    
        .background(.blue)
        
        }

        .onAppear{
            
            if selectedTeam != nil{
                self.networkManager.fetchData("\(url)\(selectedTeam!)&page=\(page)")
                
            }
                
            self.networkManager.fetchData(urlForTitle)
            
        }

    }
    
}

struct SelectedTeamView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTeamView()
    }
}
