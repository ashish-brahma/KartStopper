//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.background))
                .ignoresSafeArea()
                .scaledToFill()
            
            Text("You're Awesome.")
                .foregroundStyle(.richBlack)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    HomeView()
}
