//
//  ListItemModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI
import SwiftData

@Model
final class ListItemModel {
    @Attribute(.unique) var id = UUID()
    var name: String
    var thumbnail: String
    var pictures: [String]
    var detail: String
    var price: Double
    var tags: [String]
    @Relationship var guide: Guide
    var isFavourited: Bool
    var numUnits: Int
    
    init(id: UUID = UUID(),
         name: String,
         thumbnail: String,
         pictures: [String],
         detail: String,
         price: Double,
         tags: [String],
         guide: Guide,
         isFavourited: Bool = false,
         numUnits: Int = 1) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.pictures = pictures
        self.detail = detail
        self.price = price
        self.tags = tags
        self.guide = guide
        self.isFavourited = isFavourited
        self.numUnits = numUnits
    }
    
}

@Model
class Guide: Identifiable {
    @Attribute(.unique) var id = UUID()
    var score: Int
    @Relationship var info: ProductInfo
    
    init(score: Int, info: ProductInfo) {
        self.score = score
        self.info = info
    }
    
    var title : String {
        score > 50 ? "Go Ahead" : "Not Recommended"
    }
    
    var icon : String {
        score > 50 ? "hand.thumbsup" : "hand.thumbsdown"
    }
}

@Model
class ProductInfo: Identifiable {
    @Attribute(.unique) var id = UUID()
    var productSafety: String
    var shippingPolicy: String
    var carbonImpact: String
    
    init(productSafety: String, shippingPolicy: String, carbonImpact: String) {
        self.productSafety = productSafety
        self.shippingPolicy = shippingPolicy
        self.carbonImpact = carbonImpact
    }
}
