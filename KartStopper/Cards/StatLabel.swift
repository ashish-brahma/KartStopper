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
    let currency: Currency = .usd
    
    var body: some View {
        GeometryReader { reader in
            VStack() {
                // Header
                HStack(alignment: .firstTextBaseline) {
                    Text(name)
                        .font(.title2)
                        .foregroundStyle(Color.foreground)
                        .bold()
                        .padding(.vertical, 12)
                    
                    Spacer()
                    
                    Image(systemName: K.trackStatLabelSymbol)
                        .foregroundStyle(.gray700)
                }
                .padding(.horizontal)
                
                Divider()
                    .background(Color.secondary)
                
                // Short description
                HStack {
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(.primary.opacity(0.9))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 4)
                
                Spacer()
                
                // Number
                HStack {
                    Text(currency.symbol)
                        .foregroundStyle(.letterJacket)
                    
                    Text(String(format: K.decimalFormat, stat))
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color.accentColor)
                }
                
                Spacer(minLength: 30)
            }
            .background(Color.cardLabel)
            .clipShape(.rect(cornerRadius:25))
        }
    }
}

#Preview {
    ZStack {
        Color.background
        StatLabel(name: "This Week",  description: "Total Spend", stat: 39.41)
            .frame(width: 200, height: 200)
    }
    .ignoresSafeArea()
}
