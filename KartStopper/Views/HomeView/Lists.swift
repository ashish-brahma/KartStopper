//
//  Lists.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct Lists: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(K.listsTitle)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(.foreground))
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                Text(K.listsFillerText)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Lists()
}
