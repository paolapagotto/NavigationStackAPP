//
//  TabBarViewConfigurator.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class TabBarViewConfigurator {
    @ViewBuilder
    func setup(coordinator: TabBarCoordinator) -> some View {
        let viewModel = TabBarViewModel(tabCoordinator: coordinator)
        TabBarView(viewModel: viewModel)
    }
}
