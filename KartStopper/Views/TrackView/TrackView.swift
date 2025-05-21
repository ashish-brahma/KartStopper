//
//  TrackView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI
import Charts

struct TrackView: View {
    let data : [ListItemModel] = ListContainer().data[0].content
    
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
                            Chart(data) { item in
                                SectorMark(angle: .value("Frequency", item.count))
                                    .foregroundStyle(by: .value("Category", item.tags[1]))
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 15))
                            .frame(height: reader.size.height/2.8)
                            .padding(.vertical, 4)
                            
                            // Today's total expense card
                            NavigationLink {
                                
                            } label : {
                                StatLabel(name: "Today", description: "Total Spend", stat: 39.41, bgColor: .neon)
                            }
                            .frame(height: reader.size.height/2.8)
                            .padding(.vertical, 4)
                            
                            // Spend by week and month
                            HStack {
                                NavigationLink {
                                    
                                } label : {
                                    StatLabel(name: "This Week", description: "Total Spend", stat: 39.41, bgColor: .cardLabel)
                                }
                                
                                NavigationLink {
                                    
                                } label : {
                                    StatLabel(name: "This Month", description: "Total Spend", stat: 70.90, bgColor: .cardLabel)
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
