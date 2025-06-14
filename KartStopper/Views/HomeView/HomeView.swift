//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct HomeView: View {
    @State var showTags: Bool = false

    @State var budget = Budget()
    @State var lists = ListContainer()
    
    var numLists: Int {
        lists.data.count
    }
    
    var numTags: Int = 0
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ZStack() {
                    // Background
                    Rectangle()
                        .fill(Color(.background))
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            // Title
                            Text(budget.message)
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(Color(budget.messageColor))
                                .padding()
                                .padding(.bottom, reader.size.height/5)
                            
                            // Status Card
                            StatusCard(
                                status: budget.status,
                                current: budget.currentAmount,
                                currencySymbol: budget.currencySymbol
                            )
                            .padding(.vertical, reader.size.height/50)
                            
                            // Call to action
                            Text(K.homeCTA)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.foreground)
                                .padding(.top, reader.size.height/4.6)
                                .padding(.leading, reader.size.width/40)
                            
                            // Navigation Cards
                            HStack {
                                NavigationLink {
                                    ListExplorer(lists: $lists)
                                } label: {
                                    CardLabel(name: K.homeListsCardName, symbol: K.homeListsCardSymbol, symbolFont: .title2, stat: numLists)
                                }
                                .padding(3)
                                .accessibility(addTraits: .isButton)
                                .accessibility(identifier: "listsNavButton")
                                
                                Button {
                                    showTags.toggle()
                                } label: {
                                    CardLabel(name: K.homeTagsCardName, symbol: K.homeTagsCardSymbol, symbolFont: .title, stat: numTags)
                                }
                            }
                            .frame(width: reader.size.width/1.04, height: reader.size.height/3.6)
                            .padding(.horizontal, reader.size.width/60)
                            .navigationTitle(K.homeTabName)
                            .navigationTitleColor(Color.foreground)
                            .toolbarVisibility(.hidden, for: .navigationBar)
                            .toolbarBackgroundVisibility(.visible, for: .tabBar)
                            .background(Color(.background))
                            .foregroundStyle(Color(.foreground))
                            .sheet(isPresented: $showTags) {
                                NavigationStack {
                                    Tags(asHome: true)
                                        .presentationDetents([.medium, .large])
                                        .presentationDragIndicator(.visible)
                                }
                            }
                            
                            Spacer()
                        }
                        .frame(width: reader.size.width, height: reader.size.height, alignment: .leading)
                    }
                }
                .position(x: reader.size.width/2, y: reader.size.height/2)
            }
        }
    }
}

#Preview {
    HomeView()
}
