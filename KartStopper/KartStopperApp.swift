//
//  KartStopperApp.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/01/25.
//

import SwiftUI
import SwiftData

@main
struct KartStopperApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ListModel.self,
            ListItemModel.self,
            TagModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer : \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
