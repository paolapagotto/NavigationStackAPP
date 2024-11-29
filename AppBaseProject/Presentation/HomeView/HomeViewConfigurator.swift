//
//  HomeViewConfigurator.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class HomeViewConfigurator {
    @ViewBuilder
    func setup(coordinator: HomeCoordinator) -> some View {
        let viewModel = HomeViewModel(/*coordinator: coordinator*/)
        HomeView(viewModel: viewModel, coordinator: coordinator)
    }
}
