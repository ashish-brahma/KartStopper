//
//  ListModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import Foundation
import SwiftData

/// A representation of a shopping list.
@Model
final class ListModel {
    /// A unique identifier associated with a list.
    @Attribute(.unique) var id = UUID()
    
    /// The name given to the list.
    var name: String
    
    /// A phrase describing the list.
    var detail: String
    
    /// When the list was created.
    var date: Date
    
    /// Collection of items saved in the list.
    @Relationship(deleteRule: .cascade) var items: [ListItemModel]
    
    /// Creates a new list from the specified values.
    init(id: UUID = UUID(), name: String, detail: String, date: Date, items: [ListItemModel]) {
        self.id = id
        self.name = name
        self.detail = detail
        self.date = date
        self.items = items
    }
}

extension ListModel {
    /// A filter that checks for a date and text in the list's name.
    static func predicate(
        searchText: String,
        searchDate: Date,
    ) -> Predicate<ListModel> {
        let calendar = Calendar.autoupdatingCurrent
        let start = calendar.startOfDay(for: searchDate)
        let end = calendar.date(byAdding: .init(day: 1), to: start) ?? start
        
        return #Predicate<ListModel> { list in
            (searchText.isEmpty || list.name.localizedStandardContains(searchText))
            &&
            (list.date > start && list.date < end)
        }
    }
    
    /// Report the range of dates over which the lists were created.
    static func dateRange(modelContext: ModelContext) -> ClosedRange<Date> {
        let descriptor = FetchDescriptor<ListModel>(sortBy: [.init(\.date, order: .forward)])
        guard let lists = try? modelContext.fetch(descriptor),
              let first = lists.first?.date,
              let last = lists.last?.date else { return .distantPast ... .distantFuture }
        return first ... last
    }
    
    /// Reports the total number of lists created.
    static func totalLists(modelContext: ModelContext) -> Int {
        (try? modelContext.fetchCount(FetchDescriptor<ListModel>())) ?? 0
    }
    
    /// Reports the total number of saved tags.
    static func totalTags(modelContext: ModelContext) -> Int {
        (try? modelContext.fetchCount(FetchDescriptor<TagModel>())) ?? 0
    }
}

/// Calendar period through which history can be segmented.
enum TimePeriod: String, Codable, CaseIterable, Identifiable {
    case week, month, year
    
    var id: Self { self }
}

/// Specifications by which list items can be filtered.
enum SortParameter: String, CaseIterable, Identifiable {
    case price, score
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

extension SortOrder {
    /// A name for the sort order in the user interface.
    var name: String {
        switch self {
        case .forward: "Forward"
        case .reverse: "Reverse"
        }
    }
}

