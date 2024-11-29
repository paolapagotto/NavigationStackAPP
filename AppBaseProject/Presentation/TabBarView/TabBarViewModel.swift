//
//  TabBarViewModel.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var tabCoordinator: TabBarCoordinator
    
    init(tabCoordinator: TabBarCoordinator) {
        self.tabCoordinator = tabCoordinator
    }
}
