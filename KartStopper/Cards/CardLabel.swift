//
//  CardLabel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/04/25.
//

import SwiftUI

/// A customizable card view to navigate and display summary in HomeView.
struct CardLabel: View {
    let name: String
    let symbol: String
    let symbolFont: Font
    let stat: Int
    
    var body: some View {
        GeometryReader { reader in
            VStack() {
                // Header
                HStack(alignment: .center) {
                    Text(name)
                        .font(.title2)
                    
                    Spacer()
                    
                    Image(systemName: symbol)
                        .font(symbolFont)
                        .foregroundStyle(.gray700)
                }
                
                Spacer()
                
                // Number
                Text(String(stat))
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                
                Spacer()
            }
            .padding()
            .frame(height: reader.size.height/1.2, alignment: .top)
            .background(Color(.cardLabel))
            .clipShape(.rect(cornerRadius:25))
        }
    }
}

#Preview {
    let numLists = 1
    ZStack {
        Color.background
        CardLabel(name: K.homeTagsCardName, symbol: K.homeTagsCardSymbol, symbolFont: .body, stat: numLists)
            .frame(width: 200, height: 200)
    }
    .ignoresSafeArea()
}
