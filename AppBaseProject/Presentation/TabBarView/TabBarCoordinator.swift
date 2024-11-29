//
//  TabBarCoordinator.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 28/10/2024.
//

import Foundation
import SwiftUI

enum TabItem: Int, CaseIterable, Hashable, Identifiable {
    case home
    case search
    case shop
    case moreMenu
    
    var id: Int {
        rawValue
    }

    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .shop: return "Shop"
        case .moreMenu: return "More Menu"
        }
    }
    
    var systemImage: String {
        switch self {
        case .home: return "house.circle.fill"
        case .search: return "magnifyingglass.circle.fill"
        case .shop: return "cart.circle.fill"
        case .moreMenu: return "ellipsis.circle.fill"
        }
    }
}

class TabBarCoordinator: ObservableObject {
    
   // MARK: - Public  Properties
    @Published var selectedTab: TabItem
    @Published var tabs: [TabItem] = TabItem.allCases
    @Published var homeCoordinator: HomeCoordinator = HomeCoordinator()
    @Published var searchCoordinator: SearchCoordinator = SearchCoordinator()
    @Published var shopCoordinator: ShopCoordinator = ShopCoordinator()
    //@Published var moreMenuCoordinator: MoreMenuCoordinator = MoreMenuCoordinator()

    init(selectedTab: TabItem = .home) {
        self.selectedTab = selectedTab
    }
    
    @ViewBuilder @MainActor
    func initial(root tabItem: TabItem) -> some View {
        switch tabItem {
        case .home:
            HomeViewConfigurator().setup(coordinator: homeCoordinator)
        case .search:
            SearchViewConfigurator().setup(coordinator: searchCoordinator, categories: Category.categoriesDummy)
        case .shop:
            ShopViewConfigurator().setup(coordinator: shopCoordinator)
        case .moreMenu:
            ProfileViewConfigurator().setup(coordinator: homeCoordinator)
        }
    }
}
