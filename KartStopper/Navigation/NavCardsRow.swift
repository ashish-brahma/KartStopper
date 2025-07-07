//
//  NavCardsRow.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/07/25.
//

import SwiftUI

struct NavCardsRow: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext

    @State var showTags: Bool = false
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        HStack {
            // List card
            NavigationLink {
                ListExplorer()
                    .searchable(text: $viewModel.searchText)
                    .autocorrectionDisabled()
            } label: {
                CardLabel(name: K.homeListsCardName, symbol: K.homeListsCardSymbol, symbolFont: .title2, stat: viewModel.totalLists)
            }
            .padding(3)
            
            // Tag card
            Button {
                showTags.toggle()
            } label: {
                CardLabel(name: K.homeTagsCardName, symbol: K.homeTagsCardSymbol, symbolFont: .title, stat: viewModel.totalTags)
            }
        }
        .sheet(isPresented: $showTags) {
            NavigationStack {
                Tags(asHome: true)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
        .task {
            viewModel.update(modelContext: modelContext)
        }
    }
}

#Preview {
    GeometryReader { reader in
        VStack {
            Spacer()
            
            NavCardsRow()
                .environment(ViewModel.preview)
                .modelContainer(PreviewSampleData.container)
                .frame(width: reader.size.width/1.04, height: reader.size.height/3.6)
            
            Spacer()
        }
        .frame(width: reader.size.width, height: reader.size.height)
    }
    .background(Color.background)
    .ignoresSafeArea()
}
