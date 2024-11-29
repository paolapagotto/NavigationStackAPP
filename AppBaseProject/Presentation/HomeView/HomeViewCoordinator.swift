//
//  HomeViewCoordinator.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class HomeCoordinator: AppCoordinatorProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var coverPath: NavigationPath = NavigationPath()
    @Published var sheetPath: NavigationPath = NavigationPath()
    @Published var isPresentingSheet: Bool = false
    @Published var isPresentingCover: Bool = false
    
    @Published var alertPath: AlertPath = AlertPath()
    
    var sheetModalRoot: Route = .empty
    var coverModalRoot: Route = .empty
    
    @ViewBuilder @MainActor
    func initial() -> some View {
        HomeViewConfigurator().setup(coordinator: self)
    }
    
    @ViewBuilder
    func resolveView(for route: Route) -> some View {
        switch route {
        case .homeChild: Text("Home Child View")
        case .homeSecondChild: Text("Home Second Child View")
        case .profile: ProfileViewConfigurator().setup(coordinator: self)
        default: EmptyView()
        }
    }
    
    func push(next route: Route) {
        if isPresentingSheet {
            sheetPath.append(route)
        } else if isPresentingCover {
            coverPath.append(route)
        } else {
            path.append(route)
        }
    }
    
    func push(routes: [Route]) {
        if isPresentingSheet {
            sheetPath.append(routes)
        } else if isPresentingCover {
            coverPath.append(routes)
        } else {
            path.append(routes)
        }
    }
    
    func pop() {
        if isPresentingSheet {
            sheetPath.removeLast()
        } else if isPresentingCover {
            coverPath.removeLast()
        } else {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(sheet: Route) {
        self.isPresentingSheet = true
        self.sheetModalRoot = sheet
    }
    
    func presentFullScreenCover(cover: Route) {
        self.isPresentingCover = true
        self.coverModalRoot = cover
    }
    
    func dismissSheet() {
        self.isPresentingSheet = false
        self.sheetPath.removeLast(sheetPath.count)
    }
    
    func dismissCover() {
        self.isPresentingCover = false
        self.coverPath.removeLast(coverPath.count)
    }
    
    func presentAlert<T>(_ alert: T) where T: AlertDisplayableProtocol {
        alertPath.setAlert(alert)
    }
}
