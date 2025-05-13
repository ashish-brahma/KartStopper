//
//  GuideButton.swift
//  KartStopper
//
//  Created by Ashish Brahma on 13/05/25.
//

import SwiftUI

struct GuideButton: View {
    let item: ListItemModel
    let list: [ListItemModel]
    let asFavourite: Bool
    
    var body: some View {
        NavigationLink {
            ItemGuide(guide: item.guide, list: list, asFavourite: asFavourite)
        } label: {
            Label(K.listsGuideButtonLabel, systemImage: K.listsGuideButtonSymbol)
        }
    }
}

#Preview {
    let list = ListContainer().data[0].content
    GuideButton(item: list[0], list: list, asFavourite: true)
}
