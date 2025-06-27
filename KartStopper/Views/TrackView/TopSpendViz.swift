//
//  TopSpendViz.swift
//  KartStopper
//
//  Created by Ashish Brahma on 24/05/25.
//

import SwiftUI
import Charts

struct TopSpendViz: View {
    let data : [ListItemModel]
    
    var body: some View {
        // TODO: Refactor data model
        Chart(data) { item in
            SectorMark(angle: .value("Frequency", item.numUnits))
                .foregroundStyle(by: .value("Category", item.tags[1]))
        }
        .padding(8)
        .padding(.top, 30)
        .overlay(alignment: .topLeading) {
            Text("Top Choices")
                .font(.title2)
                .bold()
                .foregroundStyle(Color.foreground)
        }
        .padding()
        .background(Color.cardLabel)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    ZStack {
        Color.background
        TopSpendViz(data: PersistenceController.previewLists[0].items)
            .frame(height: 300)
            .padding()
    }
    .ignoresSafeArea()
}
