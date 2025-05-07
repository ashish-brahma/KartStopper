//
//  ListItem.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

struct ListItem: View {
    let item: ListItemModel
    
    var body: some View {
        HStack(alignment: .top) {
            // TODO: Checkmark functionality
            Image(systemName: K.listsCheckCircleSymbol)
                .imageScale(.large)
                .padding(.vertical)
            
            // Image
            AsyncImage(url: URL(string:item.thumbnail)) { image in
                image
                    .resizable()
                    .imageScale(.small)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .padding(.horizontal)
            
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
                SKU(count: item.count)
                    .padding(.horizontal, 6)
            }
            .frame(width: 200, height: 80)
            .padding(.vertical, 6)
            
            Spacer()
            
            // TODO: Info sheet
            Image(systemName: K.listsInfoSymbol)
                .padding(.vertical)
        }
        .padding()
        .foregroundStyle(.accent)
    }
}

#Preview {
    let lists = ListContainer()
    ListItem(item: lists.data[0].content[0])
}
