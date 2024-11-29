//
//  DetailView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import Foundation
import SwiftUI

class DetailViewConfigurator {
    @ViewBuilder
    func setup(coordinator: SearchCoordinator, category: Category) -> some View {
        let viewModel = DetailViewModel(coordinator: coordinator, category: category)
        DetailView(viewModel: viewModel)
    }
}

class DetailViewModel: ObservableObject {
    var coordinator: SearchCoordinator
    @Published var category: Category
    
    init(coordinator: SearchCoordinator, category: Category) {
        self.coordinator = coordinator
        self.category = category
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func popToRoot() {
        coordinator.popToRoot()
        //coordinator.currentTab = .home
    }
    
    func present(_ sheet: Route) {
        coordinator.presentSheet(sheet: sheet)
    }
}

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            List(viewModel.category.tasks) { task in
                Button {
                    viewModel.navigateTo(.detailTask(task.title))
                } label: {
                    Text(task.title)
                }
            }
        }
        .navigationTitle(viewModel.category.title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Back to list") {
                    viewModel.popToRoot()
                }
            }
        }
    }
}
