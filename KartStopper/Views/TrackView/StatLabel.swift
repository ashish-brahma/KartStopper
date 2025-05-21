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
    let bgColor: Color
    
    var body: some View {
        GeometryReader { reader in
            VStack() {
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
                
                HStack {
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                }
                
                Spacer()
                
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
            .background(bgColor)
            .clipShape(.rect(cornerRadius:25))
        }
    }
}

#Preview {
    StatLabel(name: "Today",  description: "Total Spend", stat: 39.41, bgColor: Color.neon)
}
