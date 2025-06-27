//
//  ContentView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var budget = Budget()
    
    var body: some View {
        TabView {
            Tab (K.homeTabName, systemImage: K.homeTabSymbol) {
                HomeView(budget: $budget)
            }
            
            Tab (K.trackTabName, systemImage: K.trackTabSymbol) {
                TrackView(budget: $budget)
            }
            
            Tab (K.manageTabName, systemImage: K.manageTabSymbol) {
                ManageView(budget: $budget)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PersistenceController.preview)
}
