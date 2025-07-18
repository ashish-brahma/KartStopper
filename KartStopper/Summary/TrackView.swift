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
                            TopSpendViz()
                                .frame(height: reader.size.height/2.2)
                            
                            TodayCard()
                                .frame(height: reader.size.height/2.2)
                                .padding(.top, 6)
                            
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
