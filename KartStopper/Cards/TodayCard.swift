//
//  TodayCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 26/05/25.
//

import SwiftUI

struct TodayCard: View {
    @Environment(ViewModel.self) private var viewModel
    let list: ListModel
    
    var body: some View {
        DisclosureGroup(K.trackStatLabelDisclosureTitle) {
            List {
                // Recent items
                Section(K.trackRecentsNavigationTitle) {
                    if !list.items.isEmpty {
                        ForEach(0..<2) { n in
                            if n < list.items.count {
                                RecentItemRow(list: list, item: list.items[n])
                                    .frame(height: 36)
                            }
                        }
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
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            ZStack {
                Color.background
                TodayCard(list: ListModel.listNow)
                    .frame(height: 240)
                    .padding()
            }
            .ignoresSafeArea()
        }
    }
    .environment(ViewModel.preview)
}
