//
//  TagRow.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/05/25.
//

import SwiftUI

struct TagRow: View {
    let tag: TagModel
    
    var body: some View {
        Label {
            Text(tag.name)
                .tag(tag.name)
        } icon: {
            Image(systemName: K.tagsRowSymbol)
                .foregroundStyle(tag.color)
        }
    }
}

#Preview {
    TagRow(tag: ListContainer().tags[0])
}
