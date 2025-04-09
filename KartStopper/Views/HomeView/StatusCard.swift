//
//  StatusCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//

import SwiftUI

struct StatusCard: View {
    @State var statusColor: Color
    @State var current: Double
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(statusColor)
            
            VStack(alignment: .leading) {
                Text(message)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(messageColor)
                    .padding()
                
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
        .frame(width: .infinity, height: 333)
    }
    
    var message: String {
        switch (statusColor) {
        case .positiveStatus:
            "You're Awesome"
            
        case .neutralStatus:
            "Slow Down"
            
        case .negativeStatus:
            "You're Broke"
            
        default:
            "Welcome"
        }
    }
    
    var messageColor: Color {
        switch (statusColor) {
        case .positiveStatus:
                .richBlack
            
        case .neutralStatus:
                .sankrit
            
        case .negativeStatus:
                .cowpeas
            
        default:
                .accent
        }
    }
}

#Preview {
    StatusCard(statusColor: .neutralStatus, current: 40.0)
}
