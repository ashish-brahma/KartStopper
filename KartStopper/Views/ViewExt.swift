//
//  ViewExt.swift
//  KartStopper
//
//  Created by Ashish Brahma on 21/04/25.
//

import SwiftUI

extension View {
    @available(iOS 14, *)
    func navigationTitleColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        
        UINavigationBar
            .appearance()
            .titleTextAttributes = [
                .foregroundColor: uiColor
            ]
        
        UINavigationBar
            .appearance()
            .largeTitleTextAttributes = [
                .foregroundColor: uiColor
            ]
        
        return self
    }
}
