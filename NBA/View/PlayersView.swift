//
//  PlayersView.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-18.
//

import SwiftUI

struct PlayersView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var url = "https://www.balldontlie.io/api/v1/players"
    @State private var selection : Team.ID?
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Search", text: $searchText)
                    .padding(.all, 5.0)
                    .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .clipShape(Capsule())
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .onChange(of: searchText) { _ in
                        self.networkManager.fetchData("https://www.balldontlie.io/api/v1/players?search=\(searchText.uppercased())")
                    }
                
                List(selection: $selection){
                    Section{
                        HStack{
                            Text("First Name")
                            Spacer()
                            Text("Last Name")
                            Spacer()
                            Text("Team")
                        }
                        .listRowBackground(Color.black)
                        .font(Font.headline.weight(.bold))
                        .foregroundColor(Color.white)
                    }
                    
                    Section{
                        ForEach (networkManager.resultsPlayers){ player in
                            NavigationLink(destination: SelectedTeamView(selectedTeam: selection)){
                                HStack{
                                    Text(player.first_name)
                                    Spacer()
                                    Text(player.last_name)
                                    Spacer()
                                    Text(player.team.full_name)
                                }
                            }
                        }
                        
                        .listRowSeparatorTint(.white)
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                    }
                }
                
            }
            .background(.red)
            .scrollContentBackground(.hidden)
            .listStyle(.automatic)
            .background(.red)
           
            .navigationTitle("Players")
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing){
                    ContentView()
                    
                }
            }
            
            
        }
        .padding(.horizontal)
        .background(.red)
        
    }
    
}
struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
