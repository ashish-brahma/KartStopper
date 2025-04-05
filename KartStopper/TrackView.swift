//
//  TrackView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct TrackView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.background))
                .ignoresSafeArea()
                .scaledToFill()
            
            Text("Summary")
                .foregroundStyle(.richBlack)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    TrackView()
}
