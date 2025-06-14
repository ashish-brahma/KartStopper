//
//  ManageView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct ManageView: View {
    @State var currency: Currency = .usd
    @State var budgetAmount = K.emptyString
    @State var budget = Budget()
    @State var budgetMode = "medium"
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ZStack {
                    // Background
                    Rectangle()
                        .fill(Color(.background))
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    List {
                        // Currency
                        Section {
                            Picker(K.manageCurrencyPickerTitle, selection: $currency) {
                                ForEach(Currency.allCases, id: \.self) { currency in
                                    Text("\(currency.name) (\(currency.symbol))").tag(currency)
                                }
                            }
                            .pickerStyle(.navigationLink)
                        } header: {
                            Text(K.manageCurrencyPickerHeader)
                        } footer: {
                            Text(K.manageCurrencyPickerFooter)
                        }
                        
                        // Budget
                        Section {
                            Stepper {
                                TextField(String(format: K.decimalFormat, budget.maxAmount), text: $budgetAmount)
                                    .keyboardType(.decimalPad)
                            } onIncrement: {
                                budget.maxAmount += 5
                            } onDecrement: {
                                budget.maxAmount -= 5
                                if budget.maxAmount < 0 {
                                    budget.maxAmount = 0
                                }
                            }
                        } header: {
                            Text(K.manageBudgetFieldHeader)
                        } footer: {
                            Text(K.manageBudgetFieldFooter)
                        }
                        
                        // Difficulty Mode
                        Section {
//                            Picker(K.manageDifficultyModePickerTitle, selection: $budgetMode) {
//                                ForEach(Mode.allCases, id: \.self) { mode in
//                                    Text(mode.rawValue).tag(mode)
//                                }
//                            }
//                            .pickerStyle(.navigationLink)
                        } header: {
                            Text(K.manageDifficultyModeHeader)
                        } footer: {
                            Text(K.manageDifficultyModeFooter)
                        }
                        
                        // Help & Support
                        NavigationLink(K.manageSupportNavigationTitle) {
                            NavigationStack {
                                List {
                                    NavigationLink(K.managePrivacyNavigationTitle) {
                                        
                                    }
                                    
                                    NavigationLink(K.manageFAQNavigationTitle) {
                                        FAQ()
                                    }
                                    
                                    NavigationLink(K.manageContactNavigationTitle) {
                                        
                                    }
                                }
                                .navigationTitle(K.manageSupportNavigationTitle)
                                .navigationBarTitleDisplayMode(.inline)
                                .scrollContentBackground(.hidden)
                                .background(Color.background)
                            }
                        }
                    }
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .leading)
                    .navigationTitle(K.manageTabNavigationTitle)
                    .navigationTitleColor(Color.foreground)
                    .scrollContentBackground(.hidden)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                }
                .position(x: reader.size.width/2, y: reader.size.height/2)
                .scrollDismissesKeyboard(.immediately)
            }
        }
    }
}

#Preview {
    ManageView()
}
