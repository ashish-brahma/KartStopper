//
//  ListItemModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

struct ListItemModel: Identifiable {
    let id: Int
    let name: String
    let thumbnail: Image
    let picture: Image
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
