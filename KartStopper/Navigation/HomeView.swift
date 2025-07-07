//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(ViewModel.self) private var viewModel
    
    @Query(sort: \ListModel.date, animation: .default) private var lists: [ListModel]
    
    @Query(sort: \TagModel.name, animation: .default) private var tags: [TagModel]
    
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
                            Text(viewModel.budget.message)
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(Color(viewModel.budget.messageColor))
                                .padding()
                                .padding(.bottom, reader.size.height/5)
                            
                            // Status Card
                            StatusCard()
                                .padding(.vertical, reader.size.height/50)
                            
                            // Call to action
                            Text(K.homeCTA)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.foreground)
                                .padding(.top, reader.size.height/4.6)
                                .padding(.leading, reader.size.width/40)
                            
                            // Navigation Cards
                            NavCardsRow()
                                .frame(width: reader.size.width/1.04, height: reader.size.height/3.6)
                                .padding(.horizontal, reader.size.width/60)
                                .navigationTitle(K.homeTabName)
                                .navigationTitleColor(Color.foreground)
                                .toolbarVisibility(.hidden, for: .navigationBar)
                                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                                .background(Color(.background))
                                .foregroundStyle(Color(.foreground))
                            
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
        .environment(ViewModel.preview)
        .modelContainer(PreviewSampleData.container)
}
