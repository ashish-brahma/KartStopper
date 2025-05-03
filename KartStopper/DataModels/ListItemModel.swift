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
    let thumbnail: Color // TODO: Image type
    let picture: Color // TODO: Image type
    let detail: String
    let price: Double
    let tags: [String]
    let guide: Guide
    let isFavourited: Bool
}

struct Guide {
    let score: Int
    let graph: AXChart? // TODO: Make graph non-optional
    let info: [String:String]
}
