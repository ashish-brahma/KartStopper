//
//  SKU.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/05/25.
//

import SwiftUI

struct SKU: View {
    @State var count: Int
    
    var body: some View {
        HStack {
            Stepper {
                Text("\(count)")
                    .foregroundStyle(Color.foreground)
                    .frame(width: 60)
                    .background {
                        // Background color
                        Color.neon
                            .clipShape(.rect(cornerRadius: 21))
                        
                        // Border
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
    let list = PreviewSampleData.previewLists[0]
    SKU(count: list.items[0].numUnits)
}
