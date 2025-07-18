//
//  ListItem.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

/// A single row in a shopping list representing an item.
struct ListItemRow: View {
    @Environment(ViewModel.self) private var viewModel
    
    @State var showInfo = false
    
    let item: ListItemModel
    let list: [ListItemModel]
    
    var body: some View {
        HStack(alignment: .top) {
            // Image
            AsyncImage(url: URL(string:item.thumbnail)) { image in
                image
                    .resizable()
                    .frame(width: 90, height: 90)
            } placeholder: {
                ProgressView()
            }
            .padding(.horizontal, 2)
            
            VStack(alignment: .leading) {
                // Name
                Text(item.name)
                    .font(.title3)
                    .foregroundStyle(Color.foreground)
                
                // Price
                Text(viewModel.budget.currencySymbol + K.spaceString + String(format: K.decimalFormat, item.price))
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 6)
            }
            .frame(height: 80, alignment: .topLeading)
            .padding(.horizontal, 8)
            
            Spacer()
            
            // Favourite status
            if item.isFavourited {
                Image(systemName: K.listsFavouritesSymbol)
                    .imageScale(.large)
                    .padding(.vertical, 5)
                    .foregroundStyle(.red)
            }
            
            // Info button
            Button {
                showInfo.toggle()
            } label: {
                Image(systemName: K.listsInfoSymbol)
                    .imageScale(.large)
                    .padding(.vertical, 5)
            }
        }
        .frame(height: 90, alignment: .topLeading)
        .foregroundStyle(.accent)
        .sheet(isPresented: $showInfo) {
            Carousel(selectedItem: item, list: list)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    let list = ListModel.listDistantPast.items
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            ListItemRow(item: list[0], list: list)
            ListItemRow(item: list[1], list: list)
        }
    }
    .environment(ViewModel.preview)
}
