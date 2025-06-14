//
//  ItemTags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct ItemTags: View {
    let tags: [TagModel]
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) {
                Text($0.name)
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
    let item = ListContainer().data[0].items[1]
    ItemTags(tags: item.tags)
}
