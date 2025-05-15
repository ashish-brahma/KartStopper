//
//  ManageView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct ManageView: View {
    @State var currency: Currency = .dollarSign
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.background))
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                List {
                    // Currency
                    Section {
                        Picker("Currency", selection: $currency) {
                            ForEach(Currency.allCases, id: \.self) { currency in
                                Label(currency.rawValue, systemImage: currency.rawValue)
                            }
                        }
                    } header: {
                        Text("Set Currency")
                    } footer: {
                        Text("Set currency based on your current location. It may differ from your place of residence.")
                    }
                    
                    // Budget
                    
                    // Difficulty Mode
                    
                    // Help & Support
                }
                .scrollContentBackground(.hidden)
            }
            .frame(width: 402)
            .navigationTitle("Preferences")
        }
    }
}

#Preview {
    ManageView()
}
