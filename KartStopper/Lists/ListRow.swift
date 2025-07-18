//
//  ListNavigator.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

/// A single row in ListExplorer.
struct ListRow: View {
    @State var list: ListModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // Title
                Text(list.name)
                    .foregroundStyle(Color.foreground)
                
                // Detail
                Text(list.detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.top, -15)
            }
            
            Spacer()
            
            // Date
            Text(String(list.date.formatted(
                .dateTime
                    .weekday(.abbreviated)
                    .year(.defaultDigits)
                    .month(.abbreviated)
                    .day(.twoDigits)
            )))
            .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        VStack {
            ListRow(list: ListModel.listDistantPast)
            ListRow(list: ListModel.listNow)
        }
    }
}

