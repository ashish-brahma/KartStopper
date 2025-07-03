//
//  ManageView.swift
//  KartStopper
//
//  Created by Ashish Brahma on 05/04/25.
//
import SwiftUI

struct ManageView: View {
    @Environment(ViewModel.self) private var viewModel
    @State var budgetAmount = K.emptyString

    var body: some View {
        @Bindable var viewModel = viewModel
        
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
                            Picker(K.manageCurrencyPickerTitle, selection: $viewModel.budget.currency) {
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
                                TextField(String(format: K.decimalFormat, viewModel.budget.maxAmount), text: $budgetAmount)
                                    .keyboardType(.decimalPad)
                                    .onChange(of: budgetAmount) {
                                        viewModel.budget.currentAmount = Double(budgetAmount) ?? 0.0
                                    }
                            } onIncrement: {
                                viewModel.budget.maxAmount += 5
                            } onDecrement: {
                                viewModel.budget.maxAmount -= 5
                                if viewModel.budget.maxAmount < 0 {
                                    viewModel.budget.maxAmount = 0
                                }
                            }
                        } header: {
                            Text(K.manageBudgetFieldHeader)
                        } footer: {
                            Text(K.manageBudgetFieldFooter)
                        }
                        
                        // Difficulty Mode
                        Section {
                            Picker(K.manageDifficultyModePickerTitle, selection: $viewModel.budget.mode) {
                                ForEach(Mode.allCases, id: \.self) { mode in
                                    Text(mode.rawValue).tag(mode)
                                }
                            }
                            .pickerStyle(.navigationLink)
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

enum Mode: String, Codable, CaseIterable, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: Self { self }
}

#Preview {
    ManageView()
        .environment(ViewModel.preview)
        .modelContainer(PreviewSampleData.container)
}
