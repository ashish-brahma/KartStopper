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
            
            VStack {
                HStack(alignment: .top) {
                    // Headline
                    Text("This month you've spent")
                        .font(Font.custom("NewYorkMedium-SemiboldItalic", size: 16))
                        .foregroundStyle(.richBlack)
                        .padding(.top, 20)
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    // Gauge
                    CircularGauge(statusColor: statusColor, current: current )
                }
                
                HStack {
                    // Currency
                    Text("$")
                        .foregroundColor(.letterJacket)
                        .font(Font.custom("NewYorkLarge-Regular.otf", size: 48))
                    
                    // Current Amount
                    Text(String(format:"%.2f", current))
                        .foregroundColor(statusColor == .negativeStatus ? .cowpeas : .richBlack  )
                        .font(Font.custom("NewYorkLarge-Regular.otf", size: 132))
                        .padding(.leading, 10)
                }
                .padding(.top, 10)
                .padding(.bottom, -30)
            }
            .padding(.top, -80)
        }
        .frame(width: .infinity, height: 333)
    }
}

#Preview {
    StatusCard(statusColor: .neutralStatus, current: 40.0)
}
