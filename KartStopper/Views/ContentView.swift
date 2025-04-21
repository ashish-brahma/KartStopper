//
//  ContentView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab (K.homeTabName, systemImage: K.homeTabSymbol) {
                HomeView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab (K.trackTabName, systemImage: K.trackTabSymbol) {
                TrackView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab (K.manageTabName, systemImage: K.manageTabSymbol) {
                ManageView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
