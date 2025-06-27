//
//  ComparativeViz.swift
//  KartStopper
//
//  Created by Ashish Brahma on 12/05/25.
//

import SwiftUI
import Charts

struct ComparativeViz: View {
    let list: [ListItemModel]
    
    // TODO: Display for current item
    var bestItem: ListItemModel {
        let sortedList = list.sorted(by: {$0.guide.score > $1.guide.score})
        return sortedList.first!
    }
    
    var body: some View {
        Chart(list) { item in
            // Price
            BarMark (
                xStart: .value(K.chartsComparativeX1Label, -(item.price/2)),
                xEnd: .value(K.chartsComparativeX1Label, 0),
                y: .value(K.chartsComparativeYLabel, item.name),
            )
            .foregroundStyle(item.id == bestItem.id ? .green : .gray)
            .annotation(position: .leading, alignment: .center) {
                Text(item.price.formatted())
                    .font(.caption)
                    .foregroundStyle(Color.foreground)
            }
            
            // Quality
            BarMark (
                xStart: .value(K.chartsComparativeX2label, 0),
                xEnd: .value(K.chartsComparativeX2label, item.guide.score/2),
                y: .value(K.chartsComparativeYLabel, item.name),
            )
            .foregroundStyle(item.id == bestItem.id ? Color.foreground : .blue)
            .annotation(position: .trailing, alignment: .center) {
                Text(item.guide.score.formatted())
                    .font(.caption)
                    .foregroundStyle(Color.foreground)
            }
        }
        .chartXAxis(.hidden)
        .frame(width: 280, height: 160)
    }
}

#Preview {
    let list = PersistenceController.previewLists[0].items
    ComparativeViz(list: list)
}
