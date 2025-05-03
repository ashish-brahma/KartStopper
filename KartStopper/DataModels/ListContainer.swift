//
//  ListContainer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

class ListContainer {
    var data: [ListModel] = []
    
    init() {
        createModelContainer()
    }
    
    func createModelContainer() {
        data.append(ListModel(name: "Pariatur celer", detail: "Amiculum torrens", date: .now, content: [
            ListItemModel(name: "Studio umerus",
                          thumbnail: Color.gray,
                          picture: Color.gray,
                          detail: "Vacuus volaticus careo. Absconditus verto delectus totus nobis atqui aduro censura ter.",
                          price: 28.99,
                          tags: ["Aecipio", "Cllus"],
                          guide: Guide(score: 86, graph: nil,
                                       info: [
                                        "Product Safety" : "This product is FDA approved.",
                                        "Shipping & Returns Policy" : "Return Period: 7 working days\nFree shipping: For orders USD 80 & above.",
                                        "Carbon Impact" : "290-930 g CO2e/kWh"
                                       ]),
                          isFavourited: false),
            
            ListItemModel(name: "Aegre tantum",
                          thumbnail: Color.gray,
                          picture: Color.gray,
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
                          thumbnail: Color.gray,
                          picture: Color.gray,
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
}
