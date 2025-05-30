//
//  TodayCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 26/05/25.
//

import SwiftUI

struct TodayCard: View {
    let list = ListContainer().data[0]
    
    var body: some View {
        DisclosureGroup(K.trackStatLabelDisclosureTitle) {
            List {
                // Recent items
                Section(K.trackRecentsNavigationTitle) {
                    ForEach(0..<2) { n in
                        RecentItemRow(list: list, item: list.content[n])
                            .frame(height: 36)
                    }
                }
                
                // History
                NavigationLink(K.trackHistoryButtonLabel) {
                    History(period: .week)
                }
                .foregroundStyle(Color.foreground)
            }
            .scrollContentBackground(.hidden)
            .background(Color.cardLabel.opacity(0.6))
            .clipShape(.rect(cornerRadius: 15))
        }
        .disclosureGroupStyle(StatCardDisclosure())
    }
}

#Preview {
    NavigationStack {
        ZStack {
            Color.background
            TodayCard()
                .frame(height: 240)
                .padding()
        }
        .ignoresSafeArea()
    }
}
