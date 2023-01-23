//
//  TeamsView.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-17.
//

import SwiftUI


struct TeamsView: View {
    //@Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var selection: Team.ID?
    @State private var url = "https://www.balldontlie.io/api/v1/teams"
    @State var sortOrder = KeyPathComparator(\Team.full_name)
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack{
                    List(selection: $selection){
                        
                        Section{
                            HStack{
                                Text("Name")
                                Spacer()
                                Text("City")
                                Spacer()
                                Text("Conference")
                            }
                            .listRowBackground(Color.black)
                            .foregroundColor(Color.white)
                            .font(Font.headline.weight(.bold))
                            
                        }
                        Section{
                            ForEach(networkManager.resultsTeams.sorted(using: sortOrder)){team in
                                NavigationLink(destination: SelectedTeamView(selectedTeam: selection)){
                                    HStack{
                                        Text(team.full_name)
                                        Spacer()
                                        Text(team.city)
                                        Spacer()
                                        Text(team.conference)
                                    }
                                }
                            }
                            
                            .listRowSeparatorTint(.white)
                            .listRowBackground(Color.black)
                            .foregroundColor(Color.white)
                            
                        }
                        
                    }
      
                    .scrollContentBackground(.hidden)
                    .listStyle(.automatic)
                    .padding(.top)
                    .navigationTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing){
                            SheetView(sortOrder: $sortOrder)
                            
                        }
                    }
                    
                    
                    //            Table(networkManager.results, selection: $selectedTeam){
                    //
                    //                    TableColumn("Name", value: \.full_name)
                    //                    TableColumn("City", value: \.city)
                    //                    TableColumn("Conference", value: \.conference)
                    //
                    //            }
                    
                    //            Table(networkManager.results){
                    //                TableColumn("Name", value: \.full_name){
                    //
                    //                    team in HStack{
                    //
                    //                        Text(team.full_name)
                    //
                    //
                    //                        Spacer()
                    //                        if horizontalSizeClass == .compact {
                    //
                    //
                    //                            Text(team.city)
                    //
                    //                            Spacer()
                    //
                    //
                    //                            Text(team.conference)
                    //
                    //                        }
                    //                    }
                    //                }
                    //                TableColumn("City", value: \.city)
                    //                TableColumn("Conference", value: \.conference)
                    //            }
                    //.onAppear(perform: loadData)
                    //                            .onChange(of: sortOrder) { newValue in
                    //                                teamsList.sort(using: newValue)
                    //                            }
                    
                }
                .background(Color.blue)
                
                
            }
            
            
        }
      
        .padding(.horizontal)
        .onAppear {
            self.networkManager.fetchData(url)
            
            
        }
        .background(.blue)
    }
    
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
