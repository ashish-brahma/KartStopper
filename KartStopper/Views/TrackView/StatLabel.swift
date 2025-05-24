//
//  StatLabel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/04/25.
//

import SwiftUI

struct StatLabel: View {
    let name: String
    let description: String
    let stat: Double
    
    var body: some View {
        GeometryReader { reader in
            VStack() {
                // Header
                HStack {
                    Text(name)
                        .font(.title2)
                        .foregroundStyle(Color.foreground)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: K.trackStatLabelSymbol)
                        .font(.body)
                        .foregroundStyle(.gray700)
                }
                
                Divider()
                    .background(Color.secondary)
                
                // Short description
                HStack {
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                }
                
                Spacer()
                
                // Number
                HStack {
                    Text(Budget().currencySymbol)
                        .foregroundStyle(.letterJacket)
                    
                    Text(String(format: K.decimalFormat, stat))
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color.foreground)
                }
                
                Spacer()
            }
            .padding()
            .frame(alignment: .top)
            .background(Color.cardLabel)
            .clipShape(.rect(cornerRadius:25))
        }
    }
}

#Preview {
    StatLabel(name: "Today",  description: "Total Spend", stat: 39.41)
        .background(Color.background)
}
