//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct ListItems: View {
    let list: ListModel
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            // List Items
            VStack {
                // TODO: Saved items
                
                // New item search field
                NewItemField()
                
                // TODO: Search results
                
                Spacer()
            }
            .navigationTitle(list.name)
        }
    }
}

#Preview {
    let lists = ListContainer()
    ListItems(list: lists.data[0])
}

