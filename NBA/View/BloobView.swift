//
//  ContentView.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-17.
//

import SwiftUI
import Liquid

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            Liquid()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .opacity(0.3)
            
            
            Liquid()
                .frame(width: 70, height: 70)
                .foregroundColor(.blue)
                .opacity(0.6)
            
            Liquid(samples: 5)
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
            
            Text("NBA").font(.subheadline).foregroundColor(.white)
        }.padding(.top)
        
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
