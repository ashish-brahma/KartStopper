//
//  CardLabel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/04/25.
//

import SwiftUI

struct CardLabel: View {
    let name: String
    let symbol: String
    let symbolFont: Font
    let stat: String
    
    var body: some View {
        VStack() {
            HStack {
                Text(name)
                    .font(.title2)
                
                Spacer()
                
                Image(systemName: symbol)
                    .font(symbolFont)
                    .foregroundStyle(.gray700)
            }
            
            Spacer()
            
            Text(stat)
                .font(.largeTitle)
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding()
        .frame(height: 160, alignment: .top)
        .background(.white.opacity(0.9))
        .clipShape(.rect(cornerRadius:25))
    }
}

#Preview {
    CardLabel(name: "Lists", symbol: "chevron.right", symbolFont: .body, stat: "0")
}
