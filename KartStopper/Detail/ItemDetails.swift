//
//  ItemDetails.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

/// A detail view that displays brief description of items in a shopping list.
struct ItemDetails: View {
    @State private var isSaved = true
    let item: ListItemModel
    let list: [ListItemModel]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                Spacer()
                
                // MARK: Pictures
                TabView {
                    ForEach(item.pictures, id: \.self) { pic in
                        AsyncImage(url: URL(string: pic)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .tabViewStyle(.page)
                .frame(width: reader.size.width/1.2 , height: reader.size.height/2)
                .clipShape(.rect(cornerRadius: 25))
                .padding(.top, 16)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        // MARK: Price
                        Price(value: item.price)
                            .padding()
                        
                        Spacer()
                        
                        // MARK: Score
                        Score(value: item.guide.score, asGuide: false)
                            .padding()
                    }
                    .padding(.top, -5)
                    
                    // MARK: Tags
                    ItemTags(tags: item.tags)
                        .padding(.top, -12)
                        .padding(.horizontal)
                    
                    // MARK: Description
                    Text(item.detail)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 12)
                        .padding(.horizontal)
                        .frame(height: 60)
                    
                    // MARK: Controls
                    VStack(alignment: .center) {
                        HStack {
                            if isSaved {
                                // MARK: Share button
                                Button {
                                    
                                } label: {
                                    Label(K.listsShareButtonLabel, systemImage: K.listsShareButtonSymbol)
                                        .imageScale(.large)
                                        .labelStyle(.iconOnly)
                                        .padding(.horizontal, 5)
                                        .padding(.vertical, 3.5)
                                }
                                .buttonStyle(.borderedProminent)
                                .buttonBorderShape(.circle)
                                .tint(.gray700)
                                .padding(.trailing)
                                
                                // MARK: Favourite button
                                Button {
                                    
                                } label: {
                                    Label(K.listsFavouriteButtonLabel, systemImage: K.listsFavouriteButtonSymbol)
                                        .imageScale(.large)
                                        .labelStyle(.iconOnly)
                                        .padding(5)
                                }
                                .buttonStyle(.borderedProminent)
                                .buttonBorderShape(.circle)
                                .tint(.pink)
                                .padding(.trailing)
                                
                                // MARK: Guide
                                GuideButton(item: item, list: list, asSheet: isSaved)
                                    .labelStyle(.iconOnly)
                                    .buttonStyle(.borderedProminent)
                                    .buttonBorderShape(.circle)
                                    .tint(.orange)
                                
                            } else {
                                GuideButton(item: item, list: list, asSheet: isSaved)
                                    .labelStyle(.titleAndIcon)
                                    .buttonStyle(.bordered)
                                    .clipShape(.rect(cornerRadius: 40))
                                    .tint(Color.foreground)
                                    .padding(.trailing)
                                
                                // MARK: Add button
                                Button {
                                    
                                } label: {
                                    Label(K.listsAddButtonLabel, systemImage: K.listsAddButtonSymbol)
                                        .foregroundStyle(.gray100)
                                }
                                .buttonStyle(.borderedProminent)
                                .clipShape(.rect(cornerRadius: 40))
                            }
                        }
                        .frame(height: 50)
                    }
                    .frame(width:reader.size.width / 1.1 , alignment: .center)
                    .padding(.top, 24)
                    
                }
                .padding()
            }
            .navigationTitle(item.name)
            .toolbar {
                if !isSaved {
                    ToolbarItem(placement: .primaryAction) {
                        // TODO: Share button
                        Button(K.listsShareButtonLabel, systemImage: K.listsShareButtonSymbol) {
                            
                        }
                    }
                    
                    ToolbarItem(placement: .primaryAction) {
                        // TODO: Favourite button
                        Button(K.listsFavouriteButtonLabel, systemImage: K.listsFavouriteButtonSymbol) {
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let list = ListModel.listDistantPast.items
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            ItemDetails(item: list[0], list: list)
        }
    }
    .environment(ViewModel.preview)
}
