//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct ListItems: View {
    let list: ListModel
    @State var searchText = K.emptyString
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
                    HStack(alignment: .top) {
                        // TODO: Checkmark functionality
                        Image(systemName: K.listsCheckCircleSymbol)
                            .imageScale(.large)
                            .padding(.vertical)
                        
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
