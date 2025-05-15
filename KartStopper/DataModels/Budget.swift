//
//  Budget.swift
//  KartStopper
//
//  Created by Ashish Brahma on 15/04/25.
//

import Foundation

struct Budget {
    var currencySymbol = Currency.dollarSign.rawValue
    var currentAmount = 0.0
    var maxAmount = 60.0
    var status : String {
        switch (currentAmount/maxAmount) {
        case 0.0..<0.5:
            K.positiveStatus
        case 0.5..<0.8:
            K.neurtalStatus
        default:
            K.negativeStatus
        }
    }
    
    var message: String {
        return K.budgetStatus[status]?[K.messageIndex] ?? K.homeTabName
    }
    
    var messageColor: String {
        return K.budgetStatus[status]?[K.colorIndex] ?? K.defaultColor
    }
}
