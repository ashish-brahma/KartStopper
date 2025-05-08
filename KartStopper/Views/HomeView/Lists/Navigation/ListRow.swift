//
//  ListNavigator.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

struct ListRow: View {
    let list: ListModel
    
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
    Group {
        ListRow(list: ListContainer().data[0])
        ListRow(list: ListContainer().data[0])
    }
}

