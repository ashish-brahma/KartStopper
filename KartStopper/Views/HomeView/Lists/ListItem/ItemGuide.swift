//
//  ItemGuide.swift
//  KartStopper
//
//  Created by Ashish Brahma on 12/05/25.
//

import SwiftUI

struct ItemGuide: View {
    let guide: Guide
    let list: [ListItemModel]
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(Color.background)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    // Title
                    HStack {
                        // Symbol
                        Image(systemName: guide.icon)
                            .imageScale(.large)
                        
                        // CTA
                        Text(guide.title)
                            .font(.largeTitle)
                    }
                    .bold()
                    
                    // Score
                    HStack {
                        Spacer()
                        
                        Score(value: guide.score, asGuide: true)
                        
                        Spacer()
                    }
                    .padding(.vertical, 50)
                    
                    // Comparison chart
                    Group {
                        Text(K.listsComparisonTitle)
                            .font(.title2)
                            .bold()
                        
                        ComparativeViz(list: list)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 40)
                    }
                    
                    Divider()
                    
                    // Important Information
                    Text(K.listsImportantInfoTitle)
                        .font(.title2)
                        .bold()
                        .padding(.vertical)
                    
                    // Product Safety
                    Text(K.listsProductSafetyTitle)
                        .font(.title3)
                    
                    Text(guide.info.productSafety)
                        .foregroundStyle(.gray)
                        .padding(.top, -8)
                    
                    // Shipping and Returns
                    Text(K.listsShippingPolicyTitle)
                        .font(.title3)
                        .padding(.top, 10)
                    
                    Text(guide.info.shippingPolicy)
                        .foregroundStyle(.gray)
                        .padding(.top, -8)
                    
                    // Carbon Impact
                    Text(K.listsCarbonImpactTitle)
                        .font(.title3)
                        .padding(.top, 10)
                    
                    Text(guide.info.carbonImpact)
                        .foregroundStyle(.gray)
                        .padding(.top, -8)
                }
                .foregroundStyle(Color.foreground)
                .padding()
            }
        }
    }
}

#Preview {
    let list = ListContainer().data[0].content
    ItemGuide(guide: list[0].guide, list: list)
}
