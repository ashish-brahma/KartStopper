//
//  NavCardsRow.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/07/25.
//

import SwiftUI

/// The row which holds cards to navigate lists and tags.
struct NavCardsRow: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext

    @State var showTags: Bool = false
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        HStack {
            // Lists card
            NavigationLink {
                ListExplorer(searchText: viewModel.searchText,
                             searchDate: viewModel.searchDate)
                    .searchable(text: $viewModel.searchText)
                    .autocorrectionDisabled()
            } label: {
                CardLabel(name: K.homeListsCardName,
                          symbol: K.homeListsCardSymbol,
                          symbolFont: .title2,
                          stat: viewModel.totalLists)
            }
            .padding(3)
            
            // Tags card
            Button {
                showTags.toggle()
            } label: {
                CardLabel(name: K.homeTagsCardName,
                          symbol: K.homeTagsCardSymbol,
                          symbolFont: .title,
                          stat: viewModel.totalTags)
            }
        }
        .background(Color(.background))
        .foregroundStyle(Color(.foreground))
        .sheet(isPresented: $showTags) {
            NavigationStack {
                Tags(asHome: true)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
        .task {
            // Update view model to show count data.
            viewModel.update(modelContext: modelContext)
        }
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        GeometryReader { reader in
            NavigationStack {
                VStack {
                    Spacer()
                    
                    NavCardsRow()
                        .frame(width: reader.size.width/1.04,
                               height: reader.size.height/3.6)
                    
                    Spacer()
                }
                .frame(width: reader.size.width)
                .background(Color.background)
                .ignoresSafeArea()
            }
        }
    }
    .environment(ViewModel.preview)
}
