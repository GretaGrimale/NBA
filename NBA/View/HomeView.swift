//
//  HomeView.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-21.
//

import SwiftUI

struct HomeView: View {
    var header = ["Name", "City", "Conference"]
    var body: some View {
        
        TabView{
            TeamsView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home").font(.largeTitle)
                }
                .toolbarBackground(
                    Color.red,
                    for: .tabBar)
            PlayersView()
                .tabItem{
                    Image(systemName: "basketball")
                    Text("Players").font(.largeTitle)
                }
                .toolbarBackground(
                    Color.red,
                    for: .tabBar)
            
        }
        
        
    }
    
    
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
