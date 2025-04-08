//
//  HomeView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct HomeView: View {
    @State var showTags: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Rectangle()
                    .fill(Color(.background))
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    // Status Card
                    StatusCard(statusColor: .positiveStatus, current: 0.0)
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
                            CardLabel(name: "Lists", symbol: "chevron.right", symbolFont: .title2, stat: "0")
                        }
                        .padding(3)
                        
                        Button {
                            showTags.toggle()
                        } label: {
                            CardLabel(name: "Tags", symbol: "plus.circle.fill", symbolFont: .title, stat: "0")
                        }
                    }
                    .navigationTitle("Home")
                    .foregroundStyle(.turkishAqua)
                    .background(Color(.background))
                    .padding(.horizontal)
                    .sheet(isPresented: $showTags) {
                        Tags()
                    }
                    
                    Spacer()
                }
                .scaledToFit()
            }
            .scaledToFill()
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    HomeView()
}
