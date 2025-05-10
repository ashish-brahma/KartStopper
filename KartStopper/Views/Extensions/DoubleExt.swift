//
//  DoubleExt.swift
//  KartStopper
//
//  Created by Ashish Brahma on 10/05/25.
//

import Foundation

extension Double {
    func getInt() -> String.SubSequence {
        let formattedVal = String(format: K.decimalFormat, self)
        let index = formattedVal.firstIndex(of: ".") ?? formattedVal.endIndex
        let int = formattedVal[..<index]
        return int
    }
    
    func getDec() -> String.SubSequence {
        let formattedVal = String(format: K.decimalFormat, self)
        let index = formattedVal.firstIndex(of: ".") ?? formattedVal.endIndex
        let dec = formattedVal[index..<formattedVal.endIndex]
        return dec
    }
}
