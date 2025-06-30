//
//  History.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/05/25.
//

import SwiftUI
import Charts

struct History: View {
    @State private var selectedPeriod: Budget.TimePeriod = .week
    
    let period: Budget.TimePeriod
    
    private let data = [
        ListModel.listNow,
        ListModel.listDistantPast
    ]
    
    var dateFormat: Date.FormatStyle {
        switch(selectedPeriod) {
        case .week:
            Date.FormatStyle()
                .weekday(.abbreviated)
        case .month:
            Date.FormatStyle()
                .day(.twoDigits)
        case .year:
            Date.FormatStyle()
                .month(.abbreviated)
                .day(.twoDigits)
        }
    }
    
    var chartHeader: String {
        switch(selectedPeriod) {
        case .week:
            "Week " + String(data.last?.date.formatted(Date.FormatStyle()
                .week()) ?? "0") + " Average"
        case .month:
            String(data.last?.date.formatted(Date.FormatStyle()
                .month(.abbreviated)) ?? "0") + " Average"
        case .year:
            String(data.last?.date.formatted(Date.FormatStyle()
                .year()) ?? "0") + " Average"
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Picker("Time Period", selection: $selectedPeriod) {
                    Text("W").tag(Budget.TimePeriod.week)
                    Text("M").tag(Budget.TimePeriod.month)
                    Text("Y").tag(Budget.TimePeriod.year)
                }
                .pickerStyle(.segmented)
                .listRowBackground(Color.clear)
                
                // Chart
                Section("Expenditure") {
                    VStack(alignment: .leading) {
                        // Caption
                        Text(chartHeader)
                            .font(.caption.smallCaps())
                            .foregroundStyle(.secondary)
                        
                        // Average
                        HStack(alignment: .firstTextBaseline) {
                            Text(Budget().currencySymbol)
                                .fontWeight(.semibold)
                                .foregroundStyle(.letterJacket)
                            
                            Text(" 19.70")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal, -8)
                        }
                    }
                    .padding(5)
                    
                    // Graph
                    Chart(data) { list in
                        BarMark(
                            x: .value("Date",list.date.formatted(dateFormat)),
                            y: .value("Cost", list.items[0].price)
                        )
                        .foregroundStyle(by: .value("Category", list.items[0].tags[1]))
                    }
                    .padding()
                }
                .listRowSeparator(.hidden)
                
                // Transactions
                ForEach(data) { list in
                    Section(header: Text("\(list.date.formatted(dateFormat))")) {
                        ForEach(list.items) { item in
                            RecentItemRow(list: list, item: item)
                                .frame(height: 36)
                        }
                    }
                }
            }
            .navigationTitle("History")
            .scrollContentBackground(.hidden)
            .background(Color.background)
        }
        .onAppear() {
            selectedPeriod = period
        }
    }
}

#Preview {
    History(period: .week)
}
