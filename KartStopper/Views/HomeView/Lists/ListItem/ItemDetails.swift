//
//  ItemDetails.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct ItemDetails: View {
    @Environment(\.dismiss) var dismiss
    @State var currencySymbol = Budget().currencySymbol
    
    let isSaved: Bool
    let item: ListItemModel
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                // Background
                Rectangle()
                    .fill(.thinMaterial)
                    .ignoresSafeArea()
                
                ScrollView {
                    Spacer()
                    
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
                    .frame(width: reader.size.width/1.2 , height: reader.size.height/2.4)
                    .clipShape(.rect(cornerRadius: 25))
                    .padding(.top, 16)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            // Price
                            Price(value: item.price)
                                .padding()
                            
                            Spacer()
                            
                            // Score
                            Score(value: item.guide.score)
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
                                // Guide
                                Button("Guide", systemImage: "questionmark.circle") {
                                    
                                }
                                .buttonStyle(.bordered)
                                .clipShape(.rect(cornerRadius: 40))
                                .tint(Color.foreground)
                                .padding(.trailing)
                                
                                // Add
                                Button("Add", systemImage: "plus") {
                                    
                                }
                                .buttonStyle(.borderedProminent)
                                .buttonStyle(.bordered)
                                .clipShape(.rect(cornerRadius: 40))
                            }
                        }
                        .frame(width:reader.size.width / 1.1 , alignment: .center)
                        .padding(.top, 32)
                        
                    }
                    .padding()
                }
                .padding(.top, 60)
                .navigationTitle(item.name)
                .toolbarTitleDisplayMode(isSaved ? .inlineLarge : .inline)
                .toolbar {
                    // Dismiss button
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(K.closeButtonTitle, systemImage: K.closeButtonSymbol, action: {dismiss()})
                            .buttonStyle(.bordered)
                            .clipShape(.circle)
                            .foregroundStyle(.secondary)
                            .bold()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    let item = ListContainer().data[0].content[0]
    NavigationStack {
        ItemDetails(isSaved: true, item: item)
    }
}
