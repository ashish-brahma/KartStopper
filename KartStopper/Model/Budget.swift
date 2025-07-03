//
//  Budget.swift
//  KartStopper
//
//  Created by Ashish Brahma on 15/04/25.
//

import Foundation

/// A representation of a budget.
struct Budget {
    /// Currency type to be used for accounting.
    var currency: Currency
    
    /// Total amount spent in the current month.
    var currentAmount: Double
    
    /// Limit to be set for budgeting expenses.
    var maxAmount: Double
    
    /// Difficulty mode used for strictness level of budget monitoring.
    var mode: Mode
}

// A convenience to retrive the currency symbol.
extension Budget {
    var currencySymbol: String {
        currency.symbol
    }
}

// Values that represent budget status on the interface.
extension Budget {
    /// A value which qualitatively describes expenditure.
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
    
    /// A short message that represents the status.
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
    
    /// A color that represents the status.
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
}
