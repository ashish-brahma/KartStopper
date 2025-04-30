//
//  Budget.swift
//  KartStopper
//
//  Created by Ashish Brahma on 15/04/25.
//

import SwiftUI

struct Budget {
    var currencySymbol = K.dollarSymbol
    var currentAmount = 40.0
    var maxAmount = 60.0
    var status: String {
        guard let statusIndex = K.budgetStatus.keys.firstIndex(where: { $0.hasPrefix(K.NeutralPrefix) }) else {
            return K.defaultStatus
        }
        return K.budgetStatus[statusIndex].key
    }
    
    var message: String {
        return K.budgetStatus[status]?[K.messageIndex] ?? K.homeTabName
    }
    
    var messageColor: Color {
        return Color(K.budgetStatus[status]?[K.colorIndex] ?? K.defaultColor)
    }
}
