//
//  Currency.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import Foundation

enum Currency: Double, CaseIterable, Identifiable {
    case usd = 1.00
    
    var id: Currency { self }
    
    var name : String {
        switch self {
        case .usd: "USD"
        }
    }
    
    var symbol : String {
        switch self {
        case .usd: "$"
        }
    }
}
