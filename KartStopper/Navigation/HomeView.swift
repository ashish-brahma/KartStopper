//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI
import SwiftData

/// The main view showing summary highlights and navigation buttons.
struct HomeView: View {
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
                            DynamicTitle()
                                .padding(.bottom, reader.size.height/5)
                            
                            StatusCard()
                                .padding(.vertical, reader.size.height/50)
                            
                            // Call to action
                            Text(K.homeCTA)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(Color.foreground)
                                .padding(.top, reader.size.height/4.6)
                                .padding(.leading, reader.size.width/40)
                            
                            NavCardsRow()
                                .frame(width: reader.size.width/1.04, height: reader.size.height/3.6)
                                .padding(.horizontal, reader.size.width/60)
                            
                            Spacer()
                        }
                        .frame(width: reader.size.width, height: reader.size.height, alignment: .leading)
                    }
                }
                .position(x: reader.size.width/2, y: reader.size.height/2)
            }
            .navigationTitle(K.homeTabName)
            .navigationTitleColor(Color.foreground)
            .toolbarVisibility(.hidden, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
        }
    }
}

#Preview {
    HomeView()
        .environment(ViewModel.preview)
        .modelContainer(PreviewSampleData.container)
}


