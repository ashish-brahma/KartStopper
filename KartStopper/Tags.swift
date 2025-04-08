//
//  Tags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct Tags: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle()
                    .fill(.gray300.mix(with: .gray100, by: 0.5))
                    .ignoresSafeArea()
                
                Text("There are no tags.")
                    .navigationTitle("Tags")
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    Tags()
}
