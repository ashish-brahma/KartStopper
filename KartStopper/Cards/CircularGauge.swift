//
//  CircularGauge.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//
import SwiftUI

struct CircularGauge: View {
    let budget: Budget
    
    var body: some View {
        // Indicator
        Gauge(value: budget.currentAmount, in: 0.0...budget.maxAmount) {
            // Image
            
        } currentValueLabel: {
            Text(String(format:K.decimalFormat, budget.currentAmount))
                .foregroundColor(budget.status == .negativeStatus ? .cowpeas : .richBlack  )
                .font(Font.custom(K.newYorkLargeRegularFont, size: 18))
                .padding(.leading, -1)
            
        } minimumValueLabel: {
            Text("\(Int(0.0))")
                .foregroundColor(.gray700)
                .font(Font.custom(K.newYorkLargeRegularFont, size: 9))
            
        } maximumValueLabel: {
            Text("\(Int(budget.maxAmount))")
                .foregroundColor(.cowpeas)
                .font(Font.custom(K.newYorkLargeRegularFont, size: 9))
            
        }
        .gaugeStyle(.accessoryCircular)
        .tint(.white.opacity(0.5))
        .padding()
    }
}

#Preview {
    CircularGauge(budget: Budget())
        .scaleEffect(4)
}
