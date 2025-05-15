//
//  ListItem.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

struct ListItem: View {
    @State var showInfo = false
    @State var currencySymbol = Budget().currencySymbol
    
    let item: ListItemModel
    let list: [ListItemModel]
    let isSaved: Bool
    let asFavourite: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            // Image
            AsyncImage(url: URL(string:item.thumbnail)) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)
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
                Text(currencySymbol + K.spaceString + String(format: K.decimalFormat, item.price))
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 8)
                
                // SKU stepper
                if !asFavourite {
                    SKU(count: item.count)
                        .padding(.horizontal, 6)
                }
            }
            .frame(height: 80, alignment: .topLeading)
            .padding(.horizontal, 8)
            
            Spacer()
            
            // Favourite status
            if asFavourite {
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
        .frame(height: 110, alignment: .topLeading)
        .foregroundStyle(.accent)
        .sheet(isPresented: $showInfo) {
            Carousel(selectedItem: item, list: list, isSaved: isSaved)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    let list = ListContainer().data[0].content
    NavigationStack {
        ListItem(item: list[0], list: list, isSaved: true, asFavourite: true)
        ListItem(item: list[1], list: list, isSaved: true, asFavourite: false)
    }
}
