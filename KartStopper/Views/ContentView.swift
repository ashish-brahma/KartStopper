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
            Tab ("Home", systemImage: "house") {
                HomeView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab ("Track", systemImage: "chart.bar.xaxis.ascending.badge.clock") {
                TrackView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab ("Manage", systemImage: "book.and.wrench") {
                ManageView()
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    @available(iOS 14, *)
    func navigationTitleColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        
        UINavigationBar
            .appearance()
            .titleTextAttributes = [
                .foregroundColor: uiColor
            ]
        
        UINavigationBar
            .appearance()
            .largeTitleTextAttributes = [
                .foregroundColor: uiColor
            ]
        
        return self
    }
}
