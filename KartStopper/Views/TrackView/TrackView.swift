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
                ZStack {
                    Rectangle()
                        .fill(Color.background)
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    List {
                        Chart(data) { item in
                            SectorMark(angle: .value("Frequency", item.count))
                                .foregroundStyle(by: .value("Category", item.tags[1]))
                        }
                        .frame(width: 280, height: 160)
                    }
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .leading)
                    .navigationTitle(K.trackTabNavigationTitle)
                    .navigationTitleColor(Color.foreground)
                    .scrollContentBackground(.hidden)
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
