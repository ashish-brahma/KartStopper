//
//  PlusMinusDisclosure.swift
//  KartStopper
//
//  Created by Ashish Brahma on 17/05/25.
//

import SwiftUI

struct PlusMinusDisclosure: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            Button {
                configuration.isExpanded.toggle()
            } label: {
                HStack(alignment: .firstTextBaseline) {
                    configuration.label
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 8)
                    
                    Spacer()
                    
                    Image(systemName: configuration.isExpanded ? "minus" : "plus")
                        .foregroundColor(.secondary)
                        .imageScale(.medium)
                        .animation(nil, value: configuration.isExpanded)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.borderless)
            
            if configuration.isExpanded {
                configuration.content
                    .padding(.vertical, 3)
            }
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    DisclosureGroup("Sample Text") {
        Text("Sample Text")
    }
    .disclosureGroupStyle(PlusMinusDisclosure())
}
