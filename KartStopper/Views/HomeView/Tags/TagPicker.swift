//
//  TagPicker.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/05/25.
//

import SwiftUI

struct TagPicker: View {
    let tags: [TagModel]
    @State private var singleSelection = UUID()
    
    var body: some View {
        Picker(K.tagsPickerTitle, selection: $singleSelection) {
            ForEach(tags) { tag in
                TagRow(tag: tag)
            }
        }
        .pickerStyle(.inline)
        .labelsHidden()
    }
}

#Preview {
    List {
        TagPicker(tags: ListContainer().tags)
    }
}


