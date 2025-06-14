//
//  StatusCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//

import SwiftUI

struct StatusCard: View {
    @State var status: Budget.StatusType
    @State var current: Double
    @State var currencySymbol: String
    
    var body: some View {
        GeometryReader { reader in
            ZStack() {
                // Background
                Rectangle()
                    .fill(Color(status.rawValue))
                
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
                            .foregroundStyle(status == Budget.StatusType.negativeStatus ? .cowpeas : .letterJacket)
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
                .foregroundStyle(status == Budget.StatusType.negativeStatus ? .cowpeas : .richBlack)
                .padding(.vertical, reader.size.height/2)
            }
            .frame(height: reader.size.height)
        }
    }
}

#Preview {
    @Previewable @State var status = Budget().status
    @Previewable @State var current = Budget().currentAmount
    @Previewable @State var symbol = Budget().currencySymbol
    
    ZStack {
        Color.background
        StatusCard(status: status, current: current, currencySymbol: symbol)
            .frame(height: 100)
    }
    .ignoresSafeArea()
}
