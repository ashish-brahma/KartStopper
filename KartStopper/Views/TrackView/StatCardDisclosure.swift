//
//  StatCardDisclosure.swift
//  KartStopper
//
//  Created by Ashish Brahma on 24/05/25.
//

import SwiftUI

struct StatCardDisclosure: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            Button {
                configuration.isExpanded.toggle()
            } label: {
                VStack {
                    HStack(alignment: .firstTextBaseline) {
                        configuration.label
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 8)
                            .foregroundStyle(Color.foreground)
                        
                        Spacer()
                        
                        Image(systemName: configuration.isExpanded ? K.trackStatLabelDisclosureSymbol : K.trackStatLabelSymbol)
                            .font(.body)
                            .foregroundStyle(.gray700)
                    }
                    
                    if !configuration.isExpanded {
                        Divider()
                            .background(Color.secondary)
                        
                        // Short description
                        HStack {
                            Text("Total Spend")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        // Number
                        HStack {
                            Text(Budget().currencySymbol)
                                .foregroundStyle(.letterJacket)
                            
                            Text(String(format: K.decimalFormat, 39.41))
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(Color.foreground)
                        }
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color.neon)
                .clipShape(.rect(cornerRadius:25))
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
    .disclosureGroupStyle(StatCardDisclosure())
}
