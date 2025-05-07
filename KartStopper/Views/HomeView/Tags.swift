//
//  Tags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct Tags: View {
    @Environment(\.dismiss) var dismiss
    @State var tags: [String] = ["Tag1", "Tag2"]
    
    var body: some View {
        VStack {
            // Navigation
            HStack {
                // Title
                Text(K.tagsTitle)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(.foreground))
                
                Spacer()
                
                // Dismiss button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: K.tagsDismissSymbol)
                        .font(.title)
                }
            }
            .padding()
            
            Spacer()
            
            // Editor
            if tags.isEmpty {
                Text(K.tagsFillerText)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.tertiary)
                
                Spacer()
            } else {
                List {
                    Section(header: Text("Saved Tags")) {
                        ForEach(tags, id: \.self) {
                            Label($0, systemImage: "circle")
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
        }
    }
}

#Preview {
    Tags()
}
