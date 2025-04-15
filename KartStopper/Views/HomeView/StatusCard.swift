//
//  StatusCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//

import SwiftUI

struct StatusCard: View {
    @State var cardColor: String
    @State var statusColor: Color
    @State var current: Double
    
    var body: some View {
        ZStack() {
            // Background
            Rectangle()
                .fill(Color(cardColor))
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    // Headline
                    Text("This month you've spent")
                        .font(Font.custom("NewYorkMedium-SemiboldItalic", size: 16))
                        .padding(.top, 20)
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    // Gauge
                    CircularGauge(statusColor: statusColor, current: current )
                }
                .padding(.top, -20)

                HStack {
                    // Currency
                    Text("$")
                        .foregroundStyle(statusColor == .negativeStatus ? .cowpeas : .letterJacket)
                        .font(Font.custom("NewYorkLarge-Regular.otf", size: 48))
                    
                    // Current Amount
                    Text(String(format:"%.2f", current))
                        .font(Font.custom("NewYorkLarge-Regular.otf", size: 132))
                        .padding(.leading, 10)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, -20)
                .padding(.bottom, 30)
                .padding(.horizontal, 10)
            }
            .foregroundStyle(statusColor == .negativeStatus ? .cowpeas : .richBlack)
            .padding(.top, 10)
        }
        .frame(height: 333)
    }
}

#Preview {
    @Previewable @State var cardColor = Budget().status.rawValue
    @Previewable @State var messageColor = Budget().messageColor
    @Previewable @State var current = Budget().currentAmount
    
    StatusCard(cardColor: cardColor, statusColor: messageColor, current: current)
}
