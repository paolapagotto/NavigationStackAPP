//
//  ShopView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI

class ShopViewConfigurator {
    @ViewBuilder
    func setup(coordinator: ShopCoordinator) -> some View {
        let viewModel = ShopViewModel()
        ShopView(viewModel: viewModel, coordinator: coordinator)
    }
}

class ShopViewModel: ObservableObject {
    @Published var title: String = "Shop Cart View"
    @Published var buttonTitle: String = "Go to Payment View"
}

struct ShopView: View {
    @StateObject var viewModel: ShopViewModel
    @StateObject var coordinator: ShopCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(spacing: 64) {
                Text(viewModel.title)
                
                PlaceHolderCustomView()
                
                Button{
                    coordinator.push(next: .payment)
                } label: {
                    Text(viewModel.buttonTitle)
                }
            }
            .navigationTitle("Shop Cart")
            .navigationDestination(for: Route.self, destination: { route in
                coordinator.resolveView(for: route)
            })
        }
    }
}
