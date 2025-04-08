//
//  CircularGauge.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//
import SwiftUI

struct CircularGauge: View {
    let statusColor: Color
    let current: Double
    let minValue = 0.0
    let maxValue = 60.0
    
    var body: some View {
        // Indicator
        Gauge(value: current, in: minValue...maxValue) {
            // Image
            
        } currentValueLabel: {
            Text(String(format:"%.2f", current))
                .foregroundColor(statusColor == .negativeStatus ? .cowpeas : .richBlack  )
                .font(Font.custom("NewYorkLarge-Regular.otf", size: 18))
                .padding(.leading, -1)
            
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(.gray700)
                .font(Font.custom("NewYorkLarge-Regular.otf", size: 9))
            
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(.cowpeas)
                .font(Font.custom("NewYorkLarge-Regular.otf", size: 9))
            
        }
        .gaugeStyle(.accessoryCircular)
        .tint(.white.opacity(0.5))
        .padding()
    }
}

#Preview {
    CircularGauge(statusColor: .neutralStatus, current: 40.0)
}
