//
//  Lists.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct Lists: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(.gray300)
                    .ignoresSafeArea()
                
                Text("No Lists")
                    .navigationTitle("Lists")
                    .navigationTitleColor(Color(.foreground))
            }
        }
    }
}

#Preview {
    Lists()
}
