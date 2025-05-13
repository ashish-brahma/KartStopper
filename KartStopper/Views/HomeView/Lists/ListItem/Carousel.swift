//
//  Carousel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 12/05/25.
//

import SwiftUI

struct Carousel: View {
    @Environment(\.dismiss) var dismiss
    @State var selection = UUID()
    
    let selectedItem: ListItemModel
    let list: [ListItemModel]
    let asFavourite: Bool
    
    var body: some View {
        GeometryReader { reader in
            NavigationStack {
                ZStack {
                    // Background
                    Rectangle()
                        .fill(.white.mix(with: .gray, by: 0.2))
                        .ignoresSafeArea()
                    
                    TabView(selection: $selection) {
                        ForEach(list) { item in
                            ItemDetails(isSaved: true, item: item, list: list, asFavourite: asFavourite)
                                .tag(item.id)
                        }
                    }
                    .tabViewStyle(.page)
                    .background(.ultraThinMaterial)
                    .frame(width: reader.size.width , height: reader.size.height)
                    .toolbarTitleDisplayMode(.inline)
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
                    .onAppear {
                        selection = selectedItem.id
                    }
                }
            }
        }
    }
}

#Preview {
    let list = ListContainer().data[0].content
    Carousel(selectedItem: list[0], list: list, asFavourite: false)
}
