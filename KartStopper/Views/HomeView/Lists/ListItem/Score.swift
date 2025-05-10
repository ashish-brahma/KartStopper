//
//  Score.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct Score: View {
    let value: Int
    var status : String {
        switch value {
        case 50..<100:
            K.positiveStatus
        default:
            K.negativeStatus
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(status))
            
            VStack(alignment: .center) {
                Text(K.scoreTitle)
                    .font(.caption.smallCaps())
                    .foregroundStyle(status == K.negativeStatus ? .cowpeas : .accentColor)
                
                Text(String(value))
                    .font(Font.custom(K.newYorkLargeRegularFont, size: 36))
                    .foregroundStyle(status == K.negativeStatus ? .cowpeas : .richBlack)
            }
        }
        .clipShape(.rect(cornerRadius: 25))
        .frame(width: 80, height: 80)
    }
}

#Preview {
    Score(value: 50)
}
