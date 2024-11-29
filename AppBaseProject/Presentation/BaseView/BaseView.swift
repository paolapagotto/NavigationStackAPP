//
//  BaseView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI

class BaseViewConfigurator {
    @ViewBuilder
    func setup(coordinator: BaseCoordinator) -> some View {
        let viewModel = BaseViewModel(coordinator: coordinator)
        BaseView(viewModel: viewModel)
    }
}

class BaseViewModel: ObservableObject {
    @Published var coordinator: BaseCoordinator
    @Published var showSplash: Bool = false
    
    init(coordinator: BaseCoordinator) {
        self.coordinator = coordinator
    }
}

struct BaseView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var viewModel: BaseViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            /// return view
            if viewModel.showSplash {
                viewModel.coordinator.resolveView(for: .splash)
            } else {
                viewModel.coordinator.initial(root: viewModel.coordinator.appRoot)
                    .navigationDestination(for: Route.self, destination: { route in
                        viewModel.coordinator.resolveView(for: route)
                    })
            }
        }
        .sheet(isPresented: $viewModel.coordinator.isPresentingSheet) {
            NavigationStack(path: $viewModel.coordinator.sheetPath) {
                viewModel.coordinator.resolveView(for: viewModel.coordinator.sheetModalRoot)
                    .navigationDestination(for: Route.self) { route in
                        viewModel.coordinator.resolveView(for: route)
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.coordinator.isPresentingCover) {
            NavigationStack(path: $viewModel.coordinator.coverPath) {
                viewModel.coordinator.resolveView(for: viewModel.coordinator.coverModalRoot)
                    .navigationDestination(for: Route.self) { route in
                        viewModel.coordinator.resolveView(for: route)
                }
            }
        }
        .onChange(of: viewModel.coordinator.appRoot, {
            viewModel.coordinator.popToRoot()
        })
        .onAppear(perform: {
            if appRootManager.currentRoot == .initial {
                viewModel.showSplash = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    viewModel.showSplash = false
                }
            }
        })
        .alert(for: $viewModel.coordinator.alertPath)
        .accentColor(.red)
        .environmentObject(viewModel.coordinator)
    }
}

