//
//  Constants.swift
//  KartStopper
//
//  Created by Ashish Brahma on 21/04/25.
//

import Foundation

struct K {
    // Custom Fonts
    static let newYorkLargeRegularFont = "NewYorkLarge-Regular"
    static let newYorkMediumSemiboldItalicFont = "NewYorkMedium-SemiboldItalic"
    
    // Number Formatting
    static let decimalFormat = "%.2f"
    
    // Tab View
    static let homeTabName = "Home"
    static let homeTabSymbol = "house"
    static let trackTabName = "Track"
    static let trackTabSymbol = "chart.bar.xaxis.ascending.badge.clock"
    static let manageTabName = "Manage"
    static let manageTabSymbol = "book.and.wrench"
    
    // Home View
    static let homeCTA = "Continue Listing"
    static let homeListsCardName = "Lists"
    static let homeListsCardSymbol = "chevron.right"
    static let homeTagsCardName = "Tags"
    static let homeTagsCardSymbol = "plus.circle.fill"
    
    // Status Card
    static let statusCardHeadline = "This month you've spent"
    
    // Tags View
    static let tagsTitle = "Tags"
    static let tagsDismissSymbol = "xmark.circle.fill"
    static let tagsFillerText = "No tags"
    
    // Lists View
    static let listsTitle = "Lists"
    static let listsFillerText = "No Lists"
    
    // Budget Model
    static let dollarSymbol = "$"
    static let budgetStatus: [String: [String:String]] = [
        "PositiveStatus": ["message": "You're Awesome", "color": "RichBlack"],
        "NeutralStatus": ["message": "Slow Down", "color": "Sanskrit"],
        "NegativeStatus": ["message": "You're Broke", "color": "Cowpeas"]
    ]
    static let defaultStatus = "PositiveStatus"
    static let NeutralPrefix = "Neutral"
    static let messageIndex = "message"
    static let colorIndex = "color"
    static let defaultColor = "Background"
}
