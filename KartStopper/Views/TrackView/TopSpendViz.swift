//
//  TopSpendViz.swift
//  KartStopper
//
//  Created by Ashish Brahma on 24/05/25.
//

import SwiftUI
import Charts

struct TopSpendViz: View {
    let data : [ListItemModel] = ListContainer().data[0].content
    
    var body: some View {
        Chart(data) { item in
            SectorMark(angle: .value("Frequency", item.count))
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
    TopSpendViz()
}
