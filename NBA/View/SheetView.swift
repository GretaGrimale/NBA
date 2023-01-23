//
//  SheetView.swift
//  nba_app
//
//  Created by Greta Grimale on 2023-01-21.
//

import SwiftUI

struct SheetView: View {
    @State var buttonText = "Name"
    @State var showSheet = false
    @Binding var sortOrder: KeyPathComparator<Team>
    
    var body: some View {
        VStack{
            
            Button(buttonText) {
                showSheet = true
            }.confirmationDialog("Sorted by:", isPresented: $showSheet, titleVisibility: .visible){
                Button("Name"){
                    buttonText = "Name"
                    showSheet = false
                    sortOrder = KeyPathComparator(\Team.full_name)
                    
                }
                Button("City"){
                    buttonText = "City"
                    showSheet = false
                    sortOrder = KeyPathComparator(\Team.city)
                }
                Button("Conference"){
                    buttonText = "Conference"
                    showSheet = false
                    sortOrder = KeyPathComparator(\Team.conference)
                }
            }
        }
        .font(.title2)
        .foregroundColor(Color.white)
        
        .padding(.horizontal,20)
        .background(Color.red)
        .clipShape(Capsule())
        
    }
}
