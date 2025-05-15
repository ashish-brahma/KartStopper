//
//  Price.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct Price: View {
    let value: Double
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            // Symbol
            Text(Currency.dollarSign.rawValue)
                .font(Font.custom(K.newYorkLargeRegularFont, size: 24))
                .foregroundStyle(.letterJacket)
            
            // Integer value
            Text(value.getInt())
                .font(Font.custom(K.newYorkLargeRegularFont, size: 48))
                .foregroundStyle(Color.foreground)
            
            // Decimal value
            Text(value.getDec())
                .font(Font.custom(K.newYorkLargeRegularFont, size: 48))
                .foregroundStyle(.secondary)
                .padding(.leading, -10)
        }
    }
}

#Preview {
    Price(value: 28.99)
}
