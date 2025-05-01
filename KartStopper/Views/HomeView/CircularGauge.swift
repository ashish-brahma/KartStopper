//
//  CircularGauge.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//
import SwiftUI

struct CircularGauge: View {
    @State var status: String
    let current: Double
    let minValue = 0.0
    let maxValue = 60.0
    
    var body: some View {
        // Indicator
        Gauge(value: current, in: minValue...maxValue) {
            // Image
            
        } currentValueLabel: {
            Text(String(format:K.decimalFormat, current))
                .foregroundColor(status == K.negativeStatus ? .cowpeas : .richBlack  )
                .font(Font.custom(K.newYorkLargeRegularFont, size: 18))
                .padding(.leading, -1)
            
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(.gray700)
                .font(Font.custom(K.newYorkLargeRegularFont, size: 9))
            
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(.cowpeas)
                .font(Font.custom(K.newYorkLargeRegularFont, size: 9))
            
        }
        .gaugeStyle(.accessoryCircular)
        .tint(.white.opacity(0.5))
        .padding()
    }
}

#Preview {
    @Previewable @State var status = Budget().status
    @Previewable @State var current = Budget().currentAmount
    
    CircularGauge(status: status, current: current)
        .scaleEffect(4)
}
