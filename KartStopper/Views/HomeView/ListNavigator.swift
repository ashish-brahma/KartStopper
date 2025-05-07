//
//  ListBuilder.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

struct ListNavigator: View {
    let lists: [ListModel]
    
    var body: some View {
        ForEach(lists, id:\.id) { list in
            NavigationLink {
                ListEditor(list: list)
            } label: {
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
    }
}


#Preview {
    NavigationStack {
        ListNavigator(lists: ListContainer().data)
    }
}

