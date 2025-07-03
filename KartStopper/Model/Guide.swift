//
//  Guide.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/07/25.
//

import SwiftUI
import SwiftData

/// A representation of a product guide.
@Model
class Guide: Identifiable {
    /// Score determined for each product
    var score: Int
    
    /// Information associated with each product
    var info: [String:String]
    
    init(score: Int, info: [String:String]) {
        self.score = score
        self.info = info
    }
}

// Values that represent a product review verdict in the interface.
extension Guide {
    /// A title describing the app's review based on the product's score.
    var title : String {
        score > 50 ? "Go Ahead" : "Not Recommended"
    }
    
    /// An icon to represent the app's review.
    var icon : String {
        score > 50 ? "hand.thumbsup" : "hand.thumbsdown"
    }
}

