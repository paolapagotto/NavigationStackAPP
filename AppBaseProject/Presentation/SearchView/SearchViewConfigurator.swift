//
//  SearchViewConfigurator.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class SearchViewConfigurator {
    @ViewBuilder
    func setup(coordinator: SearchCoordinator, categories: [Category]) -> some View {
        let viewModel = SearchViewModel(categories: categories)
        SearchView(viewModel: viewModel, coordinator: coordinator)
    }
}
