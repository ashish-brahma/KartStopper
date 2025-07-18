//
//  TopSpendViz.swift
//  KartStopper
//
//  Created by Ashish Brahma on 24/05/25.
//

import SwiftUI
import SwiftData
import Charts

struct TopSpendViz: View {
    @Query private var data: [ListItemModel]
    
    var body: some View {
        // FIXME: Rearrange data.
        Chart(data) { item in
            SectorMark(angle: .value("Frequency", item.numUnits))
                .foregroundStyle(by: .value("Category", item.tags[1].name))
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
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        ZStack {
            Color.background
            TopSpendViz()
                .frame(height: 300)
                .padding()
        }
        .ignoresSafeArea()
    }
}
