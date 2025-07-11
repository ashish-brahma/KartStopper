//
//  ContentView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/01/25.
//

import SwiftUI
import SwiftData

/// The app's top level tab view.
struct ContentView: View {
    var body: some View {
        TabView {
            Tab (K.homeTabName, systemImage: K.homeTabSymbol) {
                HomeView()
            }
            
            Tab (K.trackTabName, systemImage: K.trackTabSymbol) {
                TrackView()
            }
            
            Tab (K.manageTabName, systemImage: K.manageTabSymbol) {
                ManageView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
        .modelContainer(for: ListModel.self, inMemory: true)
}
