//
//  ListItem.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

struct ListItem: View {
    let item: ListItemModel
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
                
                // Detail
                Text(item.detail)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.9)
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
            
            if asFavourite {
                Image(systemName: K.listsFavouritesSymbol)
                    .padding(.vertical, 5)
                    .foregroundStyle(.red)
            }
            
            // TODO: Info sheet
            Image(systemName: K.listsInfoSymbol)
                .padding(.vertical, 5)
        }
        .frame(height: 110, alignment: .topLeading)
        .foregroundStyle(.accent)
    }
}

#Preview {
    let lists = ListContainer()
    Group {
        ListItem(item: lists.data[0].content[0], asFavourite: true)
        ListItem(item: lists.data[0].content[1], asFavourite: false)
    }
}
