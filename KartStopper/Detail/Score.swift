//
//  Score.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import SwiftUI

struct Score: View {
    let value: Int
    let asGuide: Bool
    
    var status : StatusType {
        switch value {
        case 50..<100:
            .positiveStatus
        default:
            .negativeStatus
        }
    }
    
    var dimension : CGFloat {
        asGuide ? 130 : 80
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(status.rawValue))
            
            VStack(alignment: .center) {
                Text(K.scoreTitle)
                    .font(asGuide ? .body.smallCaps() : .caption.smallCaps())
                    .foregroundStyle(status == .negativeStatus ? .cowpeas : .accentColor)
                
                Text(String(value))
                    .font(Font.custom(K.newYorkLargeRegularFont, size:asGuide ? 48 : 36))
                    .foregroundStyle(status == .negativeStatus ? .cowpeas : .richBlack)
            }
        }
        .clipShape(.rect(cornerRadius: 21))
        .frame(width: dimension, height: dimension)
    }
}

#Preview {
    Group {
        Score(value: 34, asGuide: false)
        Score(value: 86, asGuide: true)
    }
}
