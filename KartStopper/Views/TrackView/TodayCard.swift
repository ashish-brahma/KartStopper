//
//  TodayCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 26/05/25.
//

import SwiftUI

struct TodayCard: View {
    var body: some View {
        DisclosureGroup(K.trackStatLabelDisclosureTitle) {
            List {
                Section("Recents") {
                    HStack {
                        Text("Studio umerus")
                        Spacer()
                        Image(systemName: "info.circle")
                    }
                    .foregroundStyle(Color.foreground)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.cardLabel.opacity(0.6))
            .clipShape(.rect(cornerRadius: 15))
        }
        .disclosureGroupStyle(StatCardDisclosure())
    }
}

#Preview {
    ZStack {
        Color.background
        TodayCard()
            .frame(height: 240)
            .padding()
    }
    .ignoresSafeArea()
}
