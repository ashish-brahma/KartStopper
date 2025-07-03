//
//  CalendarCards.swift
//  KartStopper
//
//  Created by Ashish Brahma on 26/05/25.
//

import SwiftUI

struct CalendarCards: View {
    let labels = [K.trackWeekStatCardTitle, K.trackMonthStatCardTitle]
    let timePeriod: [TimePeriod] = [.week, .month]
    let values = [39.41, 70.90]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { reader in
            LazyVGrid(columns: columns) {
                ForEach(0..<2) { i in
                    NavigationLink {
                        History(period: timePeriod[i])
                    } label : {
                        // TODO: Insert calculated value
                        StatLabel(name: labels[i], description: K.trackTotalStatCardCaption, stat: values[i])
                    }
                    .frame(height: reader.size.height)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ZStack {
            Color.background
            CalendarCards()
                .frame(height: 190)
                .padding()
        }
        .ignoresSafeArea()
    }
}
