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
        Stepper {
            HStack {
                Spacer()
                
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
                    .padding(20)
            }
        } onIncrement: {
            count += 1
        } onDecrement: {
            count -= 1
            if count < 1 { count = 1 }
        }
    }
}


#Preview {
    let list = ListModel.listDistantPast.items
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        SKU(count: list[0].numUnits)
    }
}
