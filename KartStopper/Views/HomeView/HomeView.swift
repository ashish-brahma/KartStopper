//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct HomeView: View {
    @State var showTags: Bool = false
    
    // Models
    let budget = Budget()
    let lists = ListContainer()
    
    var numLists: Int {
        lists.data.count
    }
    
    var numTags: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack() {
                // Background
                Rectangle()
                    .fill(Color(.background))
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    // Title
                    Text(budget.message)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(budget.messageColor)
                        .padding()
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    // Status Card
                    StatusCard(
                        cardColor: budget.status,
                        status: budget.status,
                        current: budget.currentAmount,
                        currencySymbol: budget.currencySymbol
                    )
                    .padding(.top, -20)
                    
                    // Call to action
                    Text(K.homeCTA)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color.foreground)
                        .padding(.top, 20)
                        .padding(.leading, 16)
                    
                    // Navigation Cards
                    HStack {
                        NavigationLink {
                            ListExplorer(lists: lists)
                        } label: {
                            CardLabel(name: K.homeListsCardName, symbol: K.homeListsCardSymbol, symbolFont: .title2, stat: numLists)
                        }
                        .padding(3)
                        
                        Button {
                            showTags.toggle()
                        } label: {
                            CardLabel(name: K.homeTagsCardName, symbol: K.homeTagsCardSymbol, symbolFont: .title, stat: numTags)
                        }
                    }
                    .navigationTitle(K.homeTabName)
                    .navigationTitleColor(Color.foreground)
                    .toolbarVisibility(.hidden, for: .navigationBar)
                    .background(Color(.background))
                    .foregroundStyle(Color(.foreground))
                    .padding(.horizontal)
                    .sheet(isPresented: $showTags) {
                        Tags()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                    
                    Spacer()
                } // TODO: Use device geometry to set width
                .frame(width: 402)
            }
        }
    }
}

#Preview {
    HomeView()
}
