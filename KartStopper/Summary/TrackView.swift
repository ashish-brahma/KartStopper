//
//  TrackView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI
import SwiftData

/// A dashboard view showing summary statistics, charts and recent history.
struct TrackView: View {
    @Environment(ViewModel.self) private var viewModel
    
    @Query(sort: \ListModel.date, animation: .default) private var lists: [ListModel]

    var data: [ListItemModel] {
        var listItems = [ListItemModel]()
        for li in lists {
            listItems.append(contentsOf: li.items)
        }
        return listItems
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ZStack(alignment: .top) {
                    // Background
                    Rectangle()
                        .fill(Color.background)
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    // Dashboard
                    ScrollView {
                        VStack {
                            // Spend by category chart
                            TopSpendViz(data: data)
                                .frame(height: reader.size.height/2.2)
                            
                            // Today's total expense card
                            TodayCard(list: lists.first ?? ListModel.listNow)
                                .frame(height: reader.size.height/2.2)
                                .padding(.top, 6)
                            
                            // Spend by week and month
                            CalendarCards()
                                .frame(height: reader.size.height/3.8, alignment: .top)
                                .padding(.top, -2)
                            
                            Spacer(minLength: 20)
                        }
                    }
                    .padding(.top)
                    .frame(width: reader.size.width/1.1, height: reader.size.height, alignment: .leading)
                    .navigationTitle(K.trackTabNavigationTitle)
                    .navigationTitleColor(Color.foreground)
                    .scrollContentBackground(.hidden)
                    .scrollIndicators(.hidden)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                }
                .position(x: reader.size.width/2, y: reader.size.height/2)
            }
        }
    }
}

#Preview {
    TrackView()
        .environment(ViewModel.preview)
        .modelContainer(PreviewSampleData.container)
}
