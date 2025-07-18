//
//  ViewModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/07/25.
//
import Foundation
import SwiftData

/// User interface configuration for budget and lists.
@Observable
class ViewModel {
    /// Budget model to be used for updating dashboard.
    var budget: Budget = Budget(currency: .usd, currentAmount: 0.0, maxAmount: 60.00, mode: .medium)
    
    /// Sort parameter to be used to sort lists.
    var sortParameter: SortParameter = .price
    
    /// Sort order to be used to sort lists.
    var sortOrder: SortOrder = .reverse
    
    /// A list or an item name to use filtering lists.
    var searchText: String = K.emptyString
    
    /// A date to use when filtering lists.
    var searchDate: Date? = nil
    
    /// The range of dates that the date picker offers for filtering lists.
    var searchDateRange: ClosedRange<Date> = .distantPast ... .distantFuture
    
    /// Total lists created in the container.
    var totalLists: Int = 0
    
    /// Total tags saved in the container.
    var totalTags: Int = 0
    
    /// Total items favourited in the container.
    var totalFavourites: Int = 0
    
    /// Updates the search date and search date range based on
    /// the current set of stored lists.
    func update(modelContext: ModelContext) {
        searchDateRange = ListModel.dateRange(modelContext: modelContext)
        totalLists = ListModel.totalLists(modelContext: modelContext)
        totalTags = TagModel.totalTags(modelContext: modelContext)
        totalFavourites = ListItemModel.totalFavourites(modelContext: modelContext)
    }
}
