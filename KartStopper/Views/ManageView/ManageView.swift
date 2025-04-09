//
//  ManageView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct ManageView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.background))
                .ignoresSafeArea()
                .scaledToFill()
            
            Text("Preferences")
                .foregroundStyle(.accent)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    ManageView()
}
