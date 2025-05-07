//
//  ListContainer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import Foundation

class ListContainer {
    var data: [ListModel] = []
    
    init() {
        createModelContainer()
    }
    
    func createModelContainer() {
        data.append(ListModel(name: "Pariatur celer", detail: "Amiculum torrens", date: .now, content: [
            ListItemModel(name: "Studio umerus",
                          thumbnail: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          pictures: ["https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                          detail: "Vacuus volaticus careo. Absconditus verto delectus totus nobis atqui aduro censura ter.",
                          price: 28.99,
                          tags: ["Aecipio", "Cllus"],
                          guide: Guide(score: 86, graph: nil,
                                       info: [
                                        "Product Safety" : "This product is FDA approved.",
                                        "Shipping & Returns Policy" : "Return Period: 7 working days\nFree shipping: For orders USD 80 & above.",
                                        "Carbon Impact" : "290-930 g CO2e/kWh"
                                       ]),
                          isFavourited: true),
            
            ListItemModel(name: "Aegre tantum",
                          thumbnail: "https://images.unsplash.com/photo-1509423350716-97f9360b4e09?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          pictures: ["https://images.unsplash.com/photo-1509423350716-97f9360b4e09?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                          detail: "Ocer capto talio venia uterque. Stips sumptus tabernus adimpleo verus venio iure cilicium theca.",
                          price: 10.42,
                          tags: ["Aecipio", "Oubvenio"],
                          guide: Guide(score: 49, graph: nil,
                                       info: [
                                        "Product Safety" : "This product complies with ESG standards.",
                                        "Shipping & Returns Policy" : "No Returns\nNo free shipping",
                                        "Carbon Impact" : "-2 g CO2e/kWh"
                                       ]),
                          isFavourited: false),
            
            ListItemModel(name: "Abundans decerno",
                          thumbnail: "https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          pictures: ["https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                          detail: "Depraedor voluptatum cibus hic provident surgo. Sumo audax sub copiose sufficio suffragium cognatus crux tertius eligendi.",
                          price: 40.39,
                          tags: ["Aecipio", "Oubvenio"],
                          guide: Guide(score: 28, graph: nil,
                                       info: [
                                        "Product Safety" : "This product failed toxicity tests.",
                                        "Shipping & Returns Policy" : "Return Period: 5-7 working days\nNo free shipping",
                                        "Carbon Impact" : "-2 g CO2e/kWh"
                                       ]),
                          isFavourited: false),
            
        ]))
    }
    
    func getFavouritesCount() -> Int {
        var numFavourites = 0
        for li in data {
            numFavourites += li.content.count(where: { $0.isFavourited })
        }
        return numFavourites
    }
    
    func getFavourites() -> [ListItemModel] {
        var favourites = [ListItemModel]()
        for li in data {
            favourites += (li.content.filter { $0.isFavourited })
        }
        return favourites
    }
}
