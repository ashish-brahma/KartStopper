//
//  TodayCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 26/05/25.
//

import SwiftUI
import SwiftData

struct TodayCard: View {
    @Environment(ViewModel.self) private var viewModel
    @Query(
        filter: ListModel.predicate(
                    searchText: K.emptyString,
                    searchDate: .now)
    ) private var lists: [ListModel]
    
    var body: some View {
        DisclosureGroup(K.trackStatLabelDisclosureTitle) {
            List {
                // Recent items
                Section(K.trackRecentsNavigationTitle) {
                    ForEach(lists) { list in
                        RecentItemRow(list: list, item: list.items[0])
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
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
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
    .environment(ViewModel.preview)
}
