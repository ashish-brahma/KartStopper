//
//  Carousel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 12/05/25.
//

import SwiftUI

/// A view to browse through snapshots of items in a shopping list.
struct Carousel: View {
    @Environment(\.dismiss) var dismiss
    @State var selection = UUID()
    
    let selectedItem: ListItemModel
    let list: [ListItemModel]
    
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
                            ItemDetails(item: item, list: list)
                                .tag(item.id)
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(width: reader.size.width , height: reader.size.height)
                    .toolbarTitleDisplayMode(.inline)
                    .toolbar {
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
    let list = ListModel.listDistantPast.items
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        Carousel(selectedItem: list[0], list: list)
    }
    .environment(ViewModel.preview)
}
