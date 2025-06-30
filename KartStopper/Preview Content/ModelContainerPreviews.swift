//
//  ModelContainerPreviews.swift
//  KartStopper
//
//  Created by Ashish Brahma on 28/06/25.
//

import SwiftUI
import SwiftData

/// A view used to create a model container in memory before showing preview content.
struct ModelContainerPreview<Content: View>: View {
    var content: () -> Content
    let container: ModelContainer

    init(
        _ modelContainer: @escaping () throws -> ModelContainer,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        do {
            self.container = try MainActor.assumeIsolated(modelContainer)
        } catch {
            fatalError("Failed to create the model container: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        content()
            .modelContainer(container)
    }
}
