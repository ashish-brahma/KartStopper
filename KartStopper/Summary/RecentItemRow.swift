//
//  RecentItemRow.swift
//  KartStopper
//
//  Created by Ashish Brahma on 29/05/25.
//

import SwiftUI

struct RecentItemRow: View {
    @Environment(ViewModel.self) private var viewModel
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
                    .padding(.top, -18)
            }
            
            Spacer()
            
            // Price
            Text("\(viewModel.budget.currencySymbol) \(String(format:K.decimalFormat, item.price))")
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
            Carousel(selectedItem: item, list: list.items)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    let list = ListModel.listDistantPast
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        RecentItemRow(list: list, item: list.items[0])
    }
    .environment(ViewModel.preview)
}
