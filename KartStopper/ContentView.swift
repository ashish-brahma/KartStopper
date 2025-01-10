//
//  ContentView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var path: [String] = []
    var body: some View {
        NavigationStack(path:$path) {
            List {
                NavigationLink("Item 1", value: "item1")
                NavigationLink("Item 2", value: "item2")
                NavigationLink("Item 3", value: "item3")
            }
            .navigationTitle("To Buy")
        }
    }
}

#Preview {
    ContentView()
}
