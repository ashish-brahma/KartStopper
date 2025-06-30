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
    let asSheet: Bool
    
    var body: some View {
        NavigationLink {
            ItemGuide(guide: item.guide, list: list)
        } label: {
            Label(K.listsGuideButtonLabel, systemImage: K.listsGuideButtonSymbol)
                .padding(asSheet ? 5 : 0)
                .imageScale(asSheet ? .large : .medium)
        }
    }
}

#Preview {
    let list = ListModel.listDistantPast.items
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        VStack {
            GuideButton(item: list[0], list: list, asSheet: false)
            GuideButton(item: list[0], list: list, asSheet: true)
                .labelStyle(.iconOnly)
        }
    }
}
