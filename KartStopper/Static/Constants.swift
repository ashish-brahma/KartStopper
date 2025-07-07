//
//  Constants.swift
//  KartStopper
//
//  Created by Ashish Brahma on 21/04/25.
//

import Foundation

enum K {
    // Custom Fonts
    static let newYorkLargeRegularFont = "NewYorkLarge-Regular"
    static let newYorkMediumSemiboldItalicFont = "NewYorkMedium-SemiboldItalic"
    
    // Number Formatting
    static let decimalFormat = "%.2f"
    
    // Strings
    static let emptyString = ""
    static let spaceString = " "
    
    // Button
    static let closeButtonTitle = "Close"
    static let closeButtonSymbol = "xmark"
    static let deleteButtonLabel = "Delete"
    static let deleteButtonImage = "trash"
    
    // Tab View
    static let homeTabName = "Home"
    static let homeTabSymbol = "house"
    static let trackTabName = "Track"
    static let trackTabSymbol = "chart.bar.xaxis.ascending.badge.clock"
    static let manageTabName = "Manage"
    static let manageTabSymbol = "book.and.wrench"
    
    // Home View
    static let homeCTA = "Continue Listing"
    static let homeListsCardName = "Lists"
    static let homeListsCardSymbol = "chevron.right"
    static let homeTagsCardName = "Tags"
    static let homeTagsCardSymbol = "plus.circle.fill"
    
    // Status Card
    static let statusCardHeadline = "This month you've spent"
    
    // Tags View
    static let tagsTitle = "Tags"
    static let tagsFillerText = "No Tags"
    static let tagsCTA = "Save tags by tapping Add button."
    static let tagsTextFieldPlaceholder = "New Tag"
    static let tagsCreateTagsHeader = "Create tags"
    static let tagsCancelButtonLabel = "Cancel"
    static let tagsAddButtonLabel = "Add"
    static let tagsCreateTagsFooter = "Choose a name and a color to create a new tag."
    static let tagsColorPickerLabel = "Color"
    static let tagsRowSymbol = "circle.fill"
    static let tagsPickerTitle = "Select tag"
    static let tagsSavedTagsHeader = "Saved tags"
    static let tagsSavedTagsFooter = "Choose a tag to apply to a list item."
    
    // Lists View
    static let listsNavigationTitle = "Lists"
    static let listsFillerText = "No Lists"
    static let listsCTA = "Tap on plus button to create."
    static let listsAddTagsButtonLabel = "Add Tags"
    static let listsAddTagsButtonImage = "tag"
    static let listsAddListButtonLabel = "Add List"
    static let listsAddListButtonImage = "plus"
    static let listsFavouritesNavigationTitle = "Favourites"
    static let listsFavouritesRowTitle = "Favourites"
    static let listsFavouritesSymbol = "heart.fill"
    static let listsSectionHeader = "Keep Going..."
    static let listsFavouritesFillerText = "No Favourites"
    static let listsFavouritesCTA = "Use heart button in item info to add it to favourites."
    static let listsNewListTitlePlaceholderLabel = "New List"
    static let listsTotalCostLabel = "Total: "
    static let listsSearchPlaceholderLabel = "Search a product"
    static let listsCheckCircleSymbol = "circle"
    static let listsInfoSymbol = "info.circle"
    static let listsGuideButtonLabel = "Guide"
    static let listsGuideButtonSymbol = "questionmark.circle"
    static let listsAddButtonLabel = "Add"
    static let listsAddButtonSymbol = "plus"
    static let listsShareButtonLabel = "Share"
    static let listsShareButtonSymbol = "square.and.arrow.up"
    static let listsFavouriteButtonLabel = "Favourite"
    static let listsFavouriteButtonSymbol = "heart"
    static let listsComparisonTitle = "How does it compare?"
    static let listsImportantInfoTitle = "Important Information"
    
    // Score Card
    static let scoreTitle = "Score"
    
    // ComparativeViz
    static let chartsComparativeX1Label = "Price"
    static let chartsComparativeX2label = "Quality"
    static let chartsComparativeYLabel = "Name"
    
    // Track View
    static let trackTabNavigationTitle = "Summary"
    static let trackStatLabelSymbol = "chevron.right"
    static let trackStatLabelDisclosureTitle = "Today"
    static let trackStatLabelDisclosureSymbol = "chevron.down"
    static let trackStatLabelDisclosureCaption = "Total Spend"
    static let trackWeekStatCardTitle = "This Week"
    static let trackMonthStatCardTitle = "This Month"
    static let trackTotalStatCardCaption = "Total Spend"
    static let trackRecentsNavigationTitle = "Recents"
    static let trackHistoryButtonLabel = "See History"
    
    // Manage View
    static let manageTabNavigationTitle = "Preferences"
    static let manageCurrencyPickerTitle = "Currency"
    static let manageCurrencyPickerHeader = "Set Currency"
    static let manageCurrencyPickerFooter = "Set currency based on your current location. It may differ from your place of residence."
    static let manageBudgetFieldHeader = "Set Budget"
    static let manageBudgetFieldFooter = "Budget limit is unlocked for modification on the first day of each month. Tap on the field to use keyboard."
    static let manageDifficultyModePickerTitle = "Difficulty"
    static let manageDifficultyModeHeader = "Set Difficulty"
    static let manageDifficultyModeFooter = "Difficulty mode sets the level of strictness with which expenses are monitored with respect to budget limit."
    static let manageSupportNavigationTitle = "Help & Support"
    static let managePrivacyNavigationTitle = "Privacy Policy"
    static let manageFAQNavigationTitle = "FAQs"
    static let manageContactNavigationTitle = "Contact"

}
