//
//  RecentItemRow.swift
//  KartStopper
//
//  Created by Ashish Brahma on 29/05/25.
//

import SwiftUI

struct RecentItemRow: View {
    @State var showInfo = false
    let list: ListModel
    let item: ListItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // List item
                Text(item.name)
                    .foregroundStyle(Color.foreground)
                
                // List name
                Text(list.name)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            // Price
            Text("\(Budget().currencySymbol) \(String(format:K.decimalFormat, item.price))")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            // Info button
            Button {
                showInfo.toggle()
            } label: {
                Image(systemName: K.listsInfoSymbol)
                    .imageScale(.large)
                    .padding(.vertical, 5)
            }
        }
        .sheet(isPresented: $showInfo) {
            Carousel(selectedItem: item, list: list.content, isSaved: true)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    let list = ListContainer().data[0]
    RecentItemRow(list: list, item: list.content[0])
}
