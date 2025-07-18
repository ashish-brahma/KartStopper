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
    @Attribute(.unique) var id: UUID
    
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
    
    /// A boolean value indicating if the item has been added to favourites.
    var isFavourited: Bool
    
    /// The number of units of the SKU that need to be purchased.
    var numUnits: Int
    
    /// A list containing the item.
    @Relationship(inverse: \ListModel.items)
    var lists: [ListModel]
    
    /// A collection of values used to describe the item.
    @Relationship(inverse: \TagModel.items)
    var tags: [TagModel]
    
    /// A shopping guide providing stats, critical info and review.
    @Relationship(deleteRule: .cascade)
    var guide: Guide
    
    /// Creates a new list item from the specified values.
    init(name: String,
         thumbnail: String,
         pictures: [String],
         detail: String,
         price: Double,
         isFavourited: Bool = false,
         numUnits: Int = 1,
         lists: [ListModel] = [],
         tags: [String] = [],
         guide: Guide
    ) {
        self.id = UUID()
        self.name = name
        self.thumbnail = thumbnail
        self.pictures = pictures
        self.detail = detail
        self.price = price
        self.isFavourited = isFavourited
        self.numUnits = numUnits
        
        self.lists = lists
        
        var storedTags = [TagModel]()
        for name in tags {
            let tag = TagModel(name: name, color: UIColor.colors.randomElement()!)
            storedTags.append(tag)
        }
        self.tags = storedTags
        
        self.guide = guide
    }
}

// A convenience to access color presets.
extension UIColor {
    static let colors: [UIColor] = [
        .black, .darkGray, .lightGray, .white, .gray, .red, .green,
        .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown
    ]
}

extension ListItemModel {
    /// Reports the total number of items favourited in all lists.
    static func totalFavourites(modelContext: ModelContext) -> Int {
        let descriptor = FetchDescriptor<ListItemModel>(
            predicate: #Predicate<ListItemModel> { $0.isFavourited })
        return (try? modelContext.fetchCount(descriptor)) ?? 0
    }
}
