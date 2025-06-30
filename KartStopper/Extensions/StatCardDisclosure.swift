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
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            } label: {
                VStack {
                    // Header
                    HStack(alignment: .firstTextBaseline) {
                        configuration.label
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.foreground)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical, 12)
                        
                        Spacer()
                        
                        Image(systemName: configuration.isExpanded ? K.trackStatLabelDisclosureSymbol : K.trackStatLabelSymbol)
                            .foregroundStyle(.gray700)
                    }
                    .padding(.horizontal)
                    
                    if !configuration.isExpanded {
                        Divider()
                            .background(Color.gray300)
                        
                        // Short description
                        HStack {
                            Text(K.trackStatLabelDisclosureCaption)
                                .font(.caption)
                                .foregroundStyle(.primary.opacity(0.9))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 4)
                        
                        Spacer()
                        
                        // Number
                        HStack {
                            Text(Budget().currencySymbol)
                                .foregroundStyle(.letterJacket)
                            
                            // TODO: Insert calculated value
                            Text(String(format: K.decimalFormat, 39.41))
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(Color.accentColor)
                        }
                        
                        Spacer(minLength: 30)
                    }
                }
                .background(Color.neon)
                .clipShape(.rect(cornerRadius:25))
            }
            .buttonStyle(.borderless)
            
            if configuration.isExpanded {
                configuration.content
                    .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 8)
    }
}


#Preview {
    ZStack {
        Color.background
        DisclosureGroup("Today") {
            Text("Sample Text")
                .padding(.horizontal, 20)
        }
        .disclosureGroupStyle(StatCardDisclosure())
        .frame(width: 200, height: 200)
    }
    .ignoresSafeArea()
}
