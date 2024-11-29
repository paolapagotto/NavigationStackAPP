//
//  SearchView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @StateObject var coordinator: SearchCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                List(viewModel.categories) { category in
                    Button {
                        coordinator.push(next: .detail(category))
                    } label: {
                        HStack {
                            Text(category.title)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                    }
                    .tint(.primary)
                }
                .searchable(text: $viewModel.searchText, placement: .automatic, prompt: "Name or Brand")
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        coordinator.presentSheet(sheet: .addCategory)
                    }
                }
            }
            .navigationDestination(for: Route.self, destination: { route in
                coordinator.resolveView(for: route)
            })
        }
        .sheet(isPresented: $coordinator.isPresentingSheet) {
            NavigationStack(path: $coordinator.sheetPath) {
                coordinator.resolveView(for: coordinator.sheetModalRoot)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.resolveView(for: route)
                }
            }
        }
        .fullScreenCover(isPresented: $coordinator.isPresentingCover) {
            NavigationStack(path: $coordinator.coverPath) {
                coordinator.resolveView(for: coordinator.coverModalRoot)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.resolveView(for: route)
                }
            }
        }
        .alert(for: $coordinator.alertPath)
    }
        
    private func addNewHabit(_ category: Category) {
        viewModel.categories.append(category)
    }
}
