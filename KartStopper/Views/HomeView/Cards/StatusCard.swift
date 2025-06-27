//
//  StatusCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//

import SwiftUI

struct StatusCard: View {
    let budget: Budget
    
    var body: some View {
        GeometryReader { reader in
            ZStack() {
                // Background
                Rectangle()
                    .fill(Color(budget.status.rawValue))
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        // Headline
                        Text(K.statusCardHeadline)
                            .font(Font.custom(K.newYorkMediumSemiboldItalicFont, size: 16))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        // Gauge
                        CircularGauge(budget: budget)
                    }
                    
                    HStack {
                        // Currency
                        Text(budget.currencySymbol)
                            .foregroundStyle(budget.status == Budget.StatusType.negativeStatus ? .cowpeas : .letterJacket)
                            .font(Font.custom(K.newYorkLargeRegularFont, size: 48))
                        
                        // Current Amount
                        Text(String(format:K.decimalFormat, budget.currentAmount))
                            .font(Font.custom(K.newYorkLargeRegularFont, size: 132))
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, -20)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                }
                .foregroundStyle(budget.status == Budget.StatusType.negativeStatus ? .cowpeas : .richBlack)
                .padding(.vertical, reader.size.height/2)
            }
            .frame(height: reader.size.height)
        }
    }
}

#Preview {
    ZStack {
        Color.background
        StatusCard(budget: Budget())
            .frame(height: 100)
    }
    .ignoresSafeArea()
}
