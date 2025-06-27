//
//  ListContainer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

@MainActor
class ListContainer {
    var data: [ListModel] = []
    var tags: [TagModel] = []
    
    init() {
        createModelContainer()
    }
    
    func createModelContainer() {
        // Sample lists
        data.append(contentsOf: PersistenceController.previewLists)
        
        // Sample tags
        tags.append(contentsOf: PersistenceController.previewTags)
    }
    
    func getFavouritesCount() -> Int {
        var numFavourites = 0
        for li in data {
            numFavourites += li.items.count(where: { $0.isFavourited })
        }
        return numFavourites
    }
    
    func getFavourites() -> [ListItemModel] {
        var favourites = [ListItemModel]()
        for li in data {
            favourites += (li.items.filter { $0.isFavourited })
        }
        return favourites
    }
}
