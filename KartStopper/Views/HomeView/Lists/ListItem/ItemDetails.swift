//
//  ItemDetails.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct ItemDetails: View {
    @State var currencySymbol = Budget().currencySymbol
    
    let isSaved: Bool
    let item: ListItemModel
    let list: [ListItemModel]
    let asFavourite: Bool
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                Spacer()
                
                // Pictures
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
                        // Price
                        Price(value: item.price)
                            .padding()
                        
                        Spacer()
                        
                        // Score
                        Score(value: item.guide.score, asGuide: false)
                            .padding()
                    }
                    .padding(.top, -5)
                    
                    // Tags
                    ItemTags(tags: item.tags)
                        .padding(.top, -12)
                        .padding(.horizontal)
                    
                    // Description
                    Text(item.detail)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 12)
                        .padding(.horizontal)
                        .frame(height: 60)
                    
                    // Controls
                    VStack(alignment: .center) {
                        HStack {
                            if asFavourite {
                                // TODO: Share button
                                Button("Share", systemImage: "square.and.arrow.up") {
                                    
                                }
                                .labelStyle(.iconOnly)
                                .buttonStyle(.borderedProminent)
                                .buttonBorderShape(.circle)
                                .tint(.gray700)
                                .padding(.trailing)
                                
                                // TODO: Favourite button
                                Button("Favourite", systemImage: "heart") {
                                    
                                }
                                .labelStyle(.iconOnly)
                                .buttonStyle(.borderedProminent)
                                .buttonBorderShape(.circle)
                                .tint(.pink)
                                .padding(.trailing)
                                
                                // Guide
                                GuideButton(item: item, list: list, asFavourite: asFavourite)
                                    .labelStyle(.iconOnly)
                                    .buttonStyle(.borderedProminent)
                                    .buttonBorderShape(.circle)
                                    .tint(.orange)
                                
                            } else {
                                // Guide
                                GuideButton(item: item, list: list, asFavourite: asFavourite)
                                    .labelStyle(.titleAndIcon)
                                    .buttonStyle(.bordered)
                                    .clipShape(.rect(cornerRadius: 40))
                                    .tint(Color.foreground)
                                    .padding(.trailing)
                                
                                // TODO: Add button
                                Button(K.listsAddButtonLabel, systemImage: K.listsAddButtonSymbol) {
                                    
                                }
                                .buttonStyle(.borderedProminent)
                                .clipShape(.rect(cornerRadius: 40))
                            }
                        }
                    }
                    .frame(width:reader.size.width / 1.1 , alignment: .center)
                    .padding(.top, 24)
                    
                }
                .padding()
            }
            .navigationTitle(item.name)
        }
    }
}

#Preview {
    let list = ListContainer().data[0].content
    NavigationStack {
        ItemDetails(isSaved: true, item: list[0], list: list, asFavourite: true)
    }
}
