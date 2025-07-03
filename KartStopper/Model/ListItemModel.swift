//
//  ListItemModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI
import SwiftData

/// A representation of a product as an item in a shopping list.
@Model
final class ListItemModel {
    /// A unique identifier associated with a list item.
    @Attribute(.unique) var id = UUID()
    
    /// Name of the item.
    var name: String
    
    /// A headshot thumbnail image depicting the actual item.
    var thumbnail: String
    
    /// A collection of photos of the acutal item.
    var pictures: [String]
    
    /// Brief description of the item.
    var detail: String
    
    /// Price of the item in the currency chosen.
    var price: Double
    
    /// A collection of values used to describe the item.
    var tags: [String]
    
    /// A shopping guide providing stats, critical info and review.
    @Relationship var guide: Guide
    
    /// A boolean value indicating if the item has been added to favourites.
    var isFavourited: Bool
    
    /// The number of units of the SKU that need to be purchased.
    var numUnits: Int
    
    /// Creates a new list item from the specified values.
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
