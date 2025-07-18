//
//  TagModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/05/25.
//
import SwiftUI
import SwiftData

/// A representation of a saved tag.
@Model final class TagModel {
    /// Both name and color of the tag must be unique.
    #Unique<TagModel>([\.name, \.colorData])
    
    /// Name of the tag
    var name: String
    
    /// A value used to store the tag color.
    var colorData: Data?
    
    /// A collection of items containing the tag.
    @Relationship var items: [ListItemModel]? = nil
    
    init(
        name: String,
        color: UIColor,
        items: [ListItemModel]? = []
    ) {
        self.name = name
        
        do {
            try self.colorData = NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        } catch {
            print(error)
        }
        
        self.items = items
    }
}

// Values that represent a tag on the interface.
extension TagModel {
    /// A color that represents the tag.
    var color: Color {
        if let data = colorData {
            do {
                return try Color(NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)!)
            } catch {
                print(error)
            }
        }
        
        return Color.clear
    }
}

extension TagModel {
    /// Reports the total number of saved tags.
    static func totalTags(modelContext: ModelContext) -> Int {
        (try? modelContext.fetchCount(FetchDescriptor<TagModel>())) ?? 0
    }
}
