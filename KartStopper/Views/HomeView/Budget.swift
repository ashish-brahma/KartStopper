//
//  Budget.swift
//  KartStopper
//
//  Created by Ashish Brahma on 15/04/25.
//

import SwiftUI

struct Budget {
    var currentAmount = 40.0
    var maxAmount = 60.0
    var status: budgetStatus = .neutralStatus
    
    enum budgetStatus: String {
        case positiveStatus = "PositiveStatus"
        case neutralStatus = "NeutralStatus"
        case negativeStatus = "NegativeStatus"
    }
    
    var message: String {
        switch (status) {
        case .positiveStatus:
            "You're Awesome"
            
        case .neutralStatus:
            "Slow Down"
            
        case .negativeStatus:
            "You're Broke"
        }
    }
    
    var messageColor: Color {
        switch (status) {
        case .positiveStatus:
                .richBlack
            
        case .neutralStatus:
                .sankrit
            
        case .negativeStatus:
                .cowpeas
        }
    }
}
