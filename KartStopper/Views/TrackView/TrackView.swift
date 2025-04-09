//
//  TrackView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct TrackView: View, Hashable {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.background))
                .ignoresSafeArea()
                .scaledToFill()
            
            Text("Summary")
                .foregroundStyle(.accent)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    TrackView()
}
