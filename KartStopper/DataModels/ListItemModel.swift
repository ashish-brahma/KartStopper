//
//  ListItemModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

struct ListItemModel: Identifiable {
    let id = UUID()
    let name: String
    var thumbnail: String
    var pictures: [String]
    let detail: String
    let price: Double
    let tags: [String]
    let guide: Guide
    let isFavourited: Bool
    var count: Int = 1
}

struct Guide {
    let score: Int
    let info: ProductInfo
    
    var title : String {
        score > 50 ? "Go Ahead" : "Not Recommended"
    }
    
    var icon : String {
        score > 50 ? "hand.thumbsup" : "hand.thumbsdown"
    }
}

struct ProductInfo {
    let productSafety: String
    let shippingPolicy: String
    let carbonImpact: String
}
