//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct HomeView: View {
    @State var showTags: Bool = false
    @State var numLists = 0
    @State var numTags = 0
    let budget = Budget()
    
    var body: some View {
        NavigationStack {
            ZStack() {
                // Background
                Rectangle()
                    .fill(Color(.background))
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    // Status Card
                    StatusCard(
                        cardColor: budget.status.rawValue,
                        statusColor: budget.messageColor,
                        current: budget.currentAmount
                    )
                    .padding(.top, -20)
                    
                    // Call to action
                    Text("Continue Listing")
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading, 16)
                    
                    // Navigation Cards
                    HStack {
                        NavigationLink {
                            Lists()
                        } label: {
                            CardLabel(name: "Lists", symbol: "chevron.right", symbolFont: .title2, stat: $numLists)
                        }
                        .padding(3)
                        
                        Button {
                            showTags.toggle()
                        } label: {
                            CardLabel(name: "Tags", symbol: "plus.circle.fill", symbolFont: .title, stat: $numTags)
                        }
                    }
                    .navigationTitle(budget.message)
                    .navigationTitleColor(budget.messageColor)
                    .background(Color(.background))
                    .foregroundStyle(Color(.foreground))
                    .padding(.horizontal)
                    .sheet(isPresented: $showTags) {
                        Tags()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                    
                    Spacer()
                }
                .frame(width: 402)
            }
        }
    }
}

#Preview {
    HomeView()
}
