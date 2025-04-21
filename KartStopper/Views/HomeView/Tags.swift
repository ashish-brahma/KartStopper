//
//  Tags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct Tags: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.gray300.mix(with: .gray100, by: 0.5))
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(K.tagsTitle)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(.foreground))
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: K.tagsDismissSymbol)
                            .font(.title)
                    }
                }
                .padding()
                
                Spacer()
                
                
                Text(K.tagsFillerText)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Tags()
}
