//
//  StatusCard.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/04/25.
//

import SwiftUI

struct StatusCard: View {
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        GeometryReader { reader in
            ZStack() {
                // Background
                Rectangle()
                    .fill(Color(viewModel.budget.status.rawValue))
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        // Headline
                        Text(K.statusCardHeadline)
                            .font(Font.custom(K.newYorkMediumSemiboldItalicFont, size: 16))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        // Gauge
                        CircularGauge()
                    }
                    
                    HStack {
                        // Currency
                        Text(viewModel.budget.currencySymbol)
                            .foregroundStyle(viewModel.budget.status == StatusType.negativeStatus ? .cowpeas : .letterJacket)
                            .font(Font.custom(K.newYorkLargeRegularFont, size: 48))
                        
                        // Current Amount
                        Text(String(format:K.decimalFormat, viewModel.budget.currentAmount))
                            .font(Font.custom(K.newYorkLargeRegularFont, size: 132))
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, -20)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                }
                .foregroundStyle(viewModel.budget.status == StatusType.negativeStatus ? .cowpeas : .richBlack)
                .padding(.vertical, reader.size.height/2)
            }
            .frame(height: reader.size.height)
        }
    }
}

enum StatusType: String, Codable, CaseIterable, Identifiable {
    case positiveStatus = "PositiveStatus"
    case neurtalStatus = "NeutralStatus"
    case negativeStatus = "NegativeStatus"
    
    var id: Self { self }
}

#Preview {
    ZStack {
        Color.background
        StatusCard()
            .environment(ViewModel.preview)
            .frame(height: 100)
    }
    .ignoresSafeArea()
}
