//
//  DynamicTitle.swift
//  KartStopper
//
//  Created by Ashish Brahma on 11/07/25.
//

import SwiftUI

/// A navigation title which shows a message based on the budget status.
struct DynamicTitle: View {
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        Text(viewModel.budget.message)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color(viewModel.budget.messageColor))
            .padding()
    }
}

#Preview {
    DynamicTitle()
        .environment(ViewModel.preview)
}
