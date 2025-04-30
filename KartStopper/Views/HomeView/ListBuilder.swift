//
//  ListBuilder.swift
//  KartStopper
//
//  Created by Ashish Brahma on 30/04/25.
//

import SwiftUI

struct ListBuilder: View {
    let lists: [ListModel]
    @State var newItem: String = K.emptyString
    
    var body: some View {
        ForEach(lists, id:\.id) { list in
            NavigationLink {
                ZStack {
                    // Background
                    Rectangle()
                        .fill(.gray300)
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            // TODO: Radio button
                            Image(systemName: "circle")
                                .padding([.leading, .trailing])
                            
                            // New item search field
                            TextField(K.listsSearchPlaceholderLabel, text: $newItem)
                                .textFieldStyle(.plain)
                        }
                        .padding(.top)
                        
                        Spacer()
                    }
                    .navigationTitle(list.name)
                }
            } label: {
                HStack {
                    // Name
                    Text(list.name)
                    
                    Spacer()
                    
                    // Date
                    Text(String(list.date.formatted(.dateTime
                                                    .weekday(.abbreviated)
                                                    .year(.defaultDigits)
                                                    .month(.abbreviated)
                                                    .day(.twoDigits))))
                }
            }
        }
    }
}


#Preview {
    let lists = ListContainer()
    ListBuilder(lists: lists.data)
}
