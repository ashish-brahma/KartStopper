//
//  TrackView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

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
                            // Spend by category chart
                            TopSpendViz()
                                .frame(height: reader.size.height/2.2)
                                .padding(.vertical, 4)
                            
                            // Today's total expense card
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
                            }
                            .disclosureGroupStyle(StatCardDisclosure())
                            .frame(height: reader.size.height/2.8)
                            .padding(.vertical, 4)
                            
                            // Spend by week and month
                            HStack {
                                NavigationLink {
                                    
                                } label : {
                                    StatLabel(name: K.trackWeekStatCardTitle, description: K.trackTotalStatCardCaption, stat: 39.41)
                                }
                                
                                NavigationLink {
                                    
                                } label : {
                                    StatLabel(name: K.trackMonthStatCardTitle, description: K.trackTotalStatCardCaption, stat: 70.90)
                                }
                            }
                            .frame(height: reader.size.height/3.6)
                            .padding(.vertical, 4)
                        }
                    }
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
}
