//
//  Budget.swift
//  KartStopper
//
//  Created by Ashish Brahma on 15/04/25.
//

import Foundation

@Observable
@MainActor
class Budget {
    var currency: Currency = .usd
    var currentAmount: Double = 0.0
    var maxAmount: Double = 60.0
    var mode: Mode = .medium
    
    var currencySymbol: String {
        Currency.usd.symbol
    }
    
    var status: StatusType {
        switch (currentAmount/maxAmount) {
        case 0.0..<0.5:
                .positiveStatus
        case 0.5..<0.8:
                .neurtalStatus
        default:
                .negativeStatus
        }
    }
    
    var message: String {
        switch status {
        case .neurtalStatus:
            "Slow Down"
        case .negativeStatus:
            "You're Broke"
        default:
            "You're Awesome"
        }
    }
    
    var messageColor: String {
        switch status {
        case .neurtalStatus:
            "Sanskrit"
        case .negativeStatus:
            "Cowpeas"
        default:
            "RichBlack"
        }
    }
    
    enum Mode: String, Codable, CaseIterable, Identifiable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
        
        var id: Self { self }
    }
    
    enum StatusType: String, Codable, CaseIterable, Identifiable {
        case positiveStatus = "PositiveStatus"
        case neurtalStatus = "NeutralStatus"
        case negativeStatus = "NegativeStatus"
        
        var id: Self { self }
    }
    
    enum TimePeriod: String, Codable, CaseIterable, Identifiable {
        case week, month, year
        
        var id: Self { self }
    }
}
