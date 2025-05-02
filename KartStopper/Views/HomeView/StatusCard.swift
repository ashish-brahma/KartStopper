//
//  StatusCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//

import SwiftUI

struct StatusCard: View {
    @State var cardColor: String
    @State var status: String
    @State var current: Double
    @State var currencySymbol: String
    
    var body: some View {
        GeometryReader { reader in
            ZStack() {
                // Background
                Rectangle()
                    .fill(Color(cardColor))
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        // Headline
                        Text(K.statusCardHeadline)
                            .font(Font.custom(K.newYorkMediumSemiboldItalicFont, size: 16))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        // Gauge
                        CircularGauge(status: status, current: current )
                    }
                    
                    HStack {
                        // Currency
                        Text(currencySymbol)
                            .foregroundStyle(cardColor == K.negativeStatus ? .cowpeas : .letterJacket)
                            .font(Font.custom(K.newYorkLargeRegularFont, size: 48))
                        
                        // Current Amount
                        Text(String(format:K.decimalFormat, current))
                            .font(Font.custom(K.newYorkLargeRegularFont, size: 132))
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, -20)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                }
                .foregroundStyle(cardColor == K.negativeStatus ? .cowpeas : .richBlack)
                .padding(.vertical, reader.size.height/2)
            }
            .frame(height: reader.size.height)
        }
    }
}

#Preview {
    @Previewable @State var cardColor = Budget().status
    @Previewable @State var status = Budget().status
    @Previewable @State var current = Budget().currentAmount
    @Previewable @State var symbol = Budget().currencySymbol
    
    StatusCard(cardColor: cardColor, status: status, current: current, currencySymbol: symbol)
}
