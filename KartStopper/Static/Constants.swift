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
    static let listsFavouritesFillerText = "No lists favourited."
    static let listsNewListTitlePlaceholderLabel = "New List"
    static let listsSearchPlaceholderLabel = "Search a product"
    static let listsCheckCircleSymbol = "circle"
    static let listsInfoSymbol = "info.circle"
    
    // Score Card
    static let scoreTitle = "Score"
    
    // Budget Model
    static let budgetStatus: [String: [String:String]] = [
        "PositiveStatus": ["message": "You're Awesome", "color": "RichBlack"],
        "NeutralStatus": ["message": "Slow Down", "color": "Sanskrit"],
        "NegativeStatus": ["message": "You're Broke", "color": "Cowpeas"]
    ]
    static let positiveStatus = "PositiveStatus"
    static let neurtalStatus = "NeutralStatus"
    static let negativeStatus = "NegativeStatus"
    static let messageIndex = "message"
    static let colorIndex = "color"
    static let defaultColor = "Background"
}
