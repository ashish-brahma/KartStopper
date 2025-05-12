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
                BarMark (
                    xStart: .value("Price", -(item.price/2)),
                    xEnd: .value("Price", 0),
                    y: .value("Name", item.name),
                )
                .foregroundStyle(item.id == bestItem.id ? .green : .gray)
                .annotation(position: .leading, alignment: .center) {
                    Text(item.price.formatted())
                        .font(.caption)
                }
                
                BarMark (
                    xStart: .value("Quality", 0),
                    xEnd: .value("Quality", item.guide.score/2),
                    y: .value("Name", item.name),
                )
                .foregroundStyle(item.id == bestItem.id ? Color.foreground : .blue)
                .annotation(position: .trailing, alignment: .center) {
                    Text(item.guide.score.formatted())
                        .font(.caption)
                }
        }
        .chartXAxis(.hidden)
        .frame(width: 280, height: 160)
    }
}

#Preview {
    let list = ListContainer().data[0].content
    ComparativeViz(list: list)
}
