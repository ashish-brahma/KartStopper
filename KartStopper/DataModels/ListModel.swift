//
//  ListModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import Foundation

struct ListModel: Identifiable {
    let id = UUID()
    let name: String
    let detail: String
    let date: Date
    let content: [ListItemModel]
}

enum TimePeriod: String, CaseIterable, Identifiable {
    case week, month, year
    var id: Self { self }
}
