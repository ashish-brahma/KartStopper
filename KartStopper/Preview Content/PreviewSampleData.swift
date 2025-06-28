//
//  Persistence.swift
//  KartStopper
//
//  Created by Ashish Brahma on 14/06/25.
//

import SwiftUI
import SwiftData

actor PreviewSampleData {
    static var previewLists: [ListModel] {
        let sampleLists = [
            ListModel(name: "Pariatur celer", detail: "Amiculum torrens", date: .distantPast, items: [
                ListItemModel(name: "Studio umerus",
                              thumbnail: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              pictures: ["https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                              detail: "Vacuus volaticus careo. Absconditus verto delectus totus nobis atqui aduro censura ter.",
                              price: 28.99,
                              tags: ["Aecipio", "Cllus"],
                              guide: Guide(score: 86,
                                           info: ProductInfo(
                                            productSafety : "This product is FDA approved.",
                                            shippingPolicy : "Return Period: 7 working days\nFree shipping: For orders USD 80 & above.",
                                            carbonImpact : "290-930 g CO2e/kWh"
                                           )),
                              isFavourited: true),
                
                ListItemModel(name: "Aegre tantum",
                              thumbnail: "https://images.unsplash.com/photo-1509423350716-97f9360b4e09?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              pictures: ["https://images.unsplash.com/photo-1509423350716-97f9360b4e09?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                              detail: "Ocer capto talio venia uterque. Stips sumptus tabernus adimpleo verus venio iure cilicium theca.",
                              price: 10.42,
                              tags: ["Aecipio", "Oubvenio"],
                              guide: Guide(score: 49,
                                           info: ProductInfo(
                                            productSafety : "This product complies with ESG standards.",
                                            shippingPolicy : "No Returns\nNo free shipping",
                                            carbonImpact : "-2 g CO2e/kWh"
                                           ))),
                
                ListItemModel(name: "Abundans decerno",
                              thumbnail: "https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              pictures: ["https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                              detail: "Depraedor voluptatum cibus hic provident surgo. Sumo audax sub copiose sufficio suffragium cognatus crux tertius eligendi.",
                              price: 40.39,
                              tags: ["Aecipio", "Oubvenio"],
                              guide: Guide(score: 28,
                                           info: ProductInfo(
                                            productSafety : "This product failed toxicity tests.",
                                            shippingPolicy : "Return Period: 5-7 working days\nNo free shipping",
                                            carbonImpact : "-2 g CO2e/kWh"
                                           ))),
                
            ]),
            ListModel(name: "Bis caterva", detail: "Colligo sumo comparo", date: .now, items: [
                ListItemModel(name: "Abundans decerno",
                              thumbnail: "https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              pictures: ["https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"],
                              detail: "Depraedor voluptatum cibus hic provident surgo. Sumo audax sub copiose sufficio suffragium cognatus crux tertius eligendi.",
                              price: 40.39,
                              tags: ["Aecipio", "Oubvenio"],
                              guide: Guide(score: 28,
                                           info: ProductInfo(
                                            productSafety : "This product failed toxicity tests.",
                                            shippingPolicy : "Return Period: 5-7 working days\nNo free shipping",
                                            carbonImpact : "-2 g CO2e/kWh"
                                           )),
                              isFavourited: false),
                
            ])
        ]
        
        return sampleLists
    }
    
    static var previewTags: [TagModel] {
        let sampleTags = [
            TagModel(name: "Virga", color: UIColor.systemMint),
            TagModel(name: "Constans", color: UIColor.yellow),
            TagModel(name: "Berelinquo", color: UIColor.red)
        ]
        
        return sampleTags
    }
    
    static var previewFavourites: [ListItemModel] {
        var favourites = [ListItemModel]()
        for li in previewLists {
            favourites += (li.items.filter { $0.isFavourited })
        }
        return favourites
    }
    
    @MainActor
    static var container: ModelContainer = {
        return try! inMemoryContainer()
    }()
    
    static var inMemoryContainer: () throws -> ModelContainer = {
        let schema = Schema([
            ListModel.self,
            ListItemModel.self,
            TagModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        let container = try! ModelContainer(for: schema, configurations: [modelConfiguration])
        
        // TODO: Create samples in model extensions.
        Task { @MainActor in
            // Insert sample lists
            for list in previewLists {
                container.mainContext.insert(list)
            }
            
            // Insert sample tags
            for tags in previewTags {
                container.mainContext.insert(tags)
            }
        }
        
        return container
    }
}
