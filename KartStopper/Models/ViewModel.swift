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
    
    /// An item name to use filtering lists.
    var searchText: String = K.emptyString
    
    /// A date to use when filtering lists.
    var searchDate: Date = .now
    
    /// The range of dates that the date picker offers for filtering lists.
    var searchDateRange: ClosedRange<Date> = .distantPast ... .distantFuture
    
    /// Total lists created in the container.
    var totalLists: Int = 0
    
    /// Total tags saved in the container.
    var totalTags: Int = 0
    
    /// Updates the search date and search date range based on
    /// the current set of stored lists.
    func update(modelContext: ModelContext) {
        searchDateRange = ListModel.dateRange(modelContext: modelContext)
        searchDate = min(searchDateRange.upperBound, .now)
        totalLists = ListModel.totalLists(modelContext: modelContext)
        totalTags = ListModel.totalTags(modelContext: modelContext)
    }
}
