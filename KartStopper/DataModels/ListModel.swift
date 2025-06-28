//
//  ListModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import Foundation
import SwiftData

@Model
final class ListModel {
    @Attribute(.unique) var id = UUID()
    var name: String
    var detail: String
    var date: Date
    
    @Relationship(deleteRule: .cascade) var items: [ListItemModel]
    
    init(id: UUID = UUID(), name: String, detail: String, date: Date, items: [ListItemModel]) {
        self.id = id
        self.name = name
        self.detail = detail
        self.date = date
        self.items = items
    }
}
