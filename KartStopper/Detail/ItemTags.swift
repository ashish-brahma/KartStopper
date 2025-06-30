//
//  ItemTags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct ItemTags: View {
    let tags: [String]
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) {
                Text($0)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 40, style: .circular)
                            .foregroundStyle(Color.accentColor)
                    }
                    .foregroundStyle(.gray100)
            }
        }
    }
}

#Preview {
    let item = ListModel.listDistantPast.items[0]
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        ItemTags(tags: item.tags)
    }
}
