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
    let isSaved: Bool
    
    var body: some View {
        GeometryReader { reader in
            NavigationStack {
                ZStack {
                    // Background
                    Rectangle()
                        .fill(Color.background)
                        .ignoresSafeArea()
                    
                    TabView(selection: $selection) {
                        ForEach(list) { item in
                            ItemDetails(isSaved: isSaved, item: item, list: list)
                                .tag(item.id)
                        }
                    }
                    .tabViewStyle(.page)
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
    let list = PersistenceController.previewLists[0].items
    Carousel(selectedItem: list[0], list: list, isSaved: true)
}
