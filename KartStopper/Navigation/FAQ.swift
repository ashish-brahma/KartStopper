//
//  FAQ.swift
//  KartStopper
//
//  Created by Ashish Brahma on 17/05/25.
//

import SwiftUI

struct FAQ: View {
    @State var searchText = K.emptyString
    
    var body: some View {
        List{
            Section {
                DisclosureGroup("What data does KartStopper collect and how is it used?") {
                    Text("We don’t collect any data which helps to establish your identity.")
                        .foregroundStyle(.secondary)
                    
                    Text("To learn more, please visit our privacy policy page.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Link("Privacy Policy", destination: URL(string: "https://ashish-brahma.github.io/kartstoppersite/")!)
                }
                .disclosureGroupStyle(PlusMinusDisclosure())
            }
        }
        .navigationTitle(K.manageFAQNavigationTitle)
        .searchable(text: $searchText)
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}

#Preview {
    NavigationStack {
        FAQ()
    }
}
