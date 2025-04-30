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
        data.append(ListModel(id: 0,name: "Pariatur celer", date: .now, content: [
            ListItemModel(id: 0,
                          name: "Studio umerus",
                          thumbnail: Image(systemName:"headphones"),
                          picture: Image(systemName:"headphones"),
                          detail: "Vacuus volaticus careo. Absconditus verto delectus totus nobis atqui aduro censura ter.",
                          price: 28.99,
                          tags: ["Aecipio", "Cllus"],
                          guide: Guide(score: 86,graph: nil,
                                       info: [
                                        "Product Safety" : "This product is FDA approved.",
                                        "Shipping & Returns Policy" : "Return Period: 7 working days\nFree shipping: For orders USD 80 & above.",
                                        "Carbon Impact" : "290-930 g CO2e/kWh"
                                       ]),
                          isFavourited: false
                         )
        ]))
    }
}
