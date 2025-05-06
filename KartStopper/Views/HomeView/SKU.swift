//
//  SKU.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/05/25.
//

import SwiftUI

struct SKU: View {
    // FIXME: Connect to data model
    @State var count: Int
    
    var body: some View {
        HStack {
            // Stepper
            Stepper {
                // Counter
                Text("\(count)")
                    .foregroundStyle(Color.foreground)
                    .padding(.horizontal, 25)
                    .background(.neon)
                    .overlay {
                        RoundedRectangle(cornerRadius: 21)
                            .stroke()
                            .foregroundStyle(Color.foreground)
                    }
            } onIncrement: {
                count += 1
            } onDecrement: {
                count -= 1
                if count < 1 { count = 1 }
            }
        }
        .padding(.vertical, 3)
    }
}


#Preview {
    let lists = ListContainer()
    SKU(count: lists.data.count)
}
