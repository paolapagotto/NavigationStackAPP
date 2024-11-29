//
//  TabBarView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 28/10/2024.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel: TabBarViewModel
    
    var body: some View {
        TabView(selection: $viewModel.tabCoordinator.selectedTab) {
            
            ForEach(self.viewModel.tabCoordinator.tabs, id: \.self) { tabItem in
                viewModel.tabCoordinator.initial(root: tabItem)
                    .tabItem { Label(tabItem.title, systemImage: tabItem.systemImage) }
                    .tag(tabItem)
                    .padding(.bottom, 16)
            }
        }
        .accentColor(.red)
        
    }
}

