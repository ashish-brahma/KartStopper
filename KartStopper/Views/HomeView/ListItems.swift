//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct ListItems: View {
    let list: ListModel
    @State var searchText = ""
    @State private var multiSelection = Set<UUID>()
    
    var filteredList: [ListItemModel] {
        if searchText.isEmpty {
            list.content
        } else {
            list.content.filter { item in
                item.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            // List Items
            VStack {
                List(filteredList, selection: $multiSelection) { item in
                    HStack {
                        // Image
                        item.thumbnail
//                            .resizable()
//                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            // Name
                            Text(item.name)
                                .font(.title3)
                            
                            // Detail
                            Text(item.detail)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 200, height: 80)
                        
                        Spacer()
                        
                        // TODO: Info sheet
                        Image(systemName: "info.circle")
                    }
                    .foregroundStyle(Color.foreground)
                }
                .listStyle(.plain)
                
                // TODO: Use inline search bar on keyboard.
                NewItemField()
                
                Spacer()
            }
            .navigationTitle(list.name)
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    let lists = ListContainer()
    ListItems(list: lists.data[0])
}

