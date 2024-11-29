//
//  AppCoordinator.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI

class BaseCoordinator: AppCoordinatorProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var coverPath: NavigationPath = NavigationPath()
    @Published var sheetPath: NavigationPath = NavigationPath()
    @Published var isPresentingSheet: Bool = false
    @Published var isPresentingCover: Bool = false
    
    @Published var alertPath: AlertPath = AlertPath()
    
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    @Published var appRoot: AppRoot = .initial

    var sheetModalRoot: Route = .empty
    var coverModalRoot: Route = .empty
    
    @ViewBuilder @MainActor
    func initial(root: AppRoot) -> some View {
        switch root {
        case .login:
            resolveView(for: .login)
        case .tab:
            resolveView(for: .home)
        case .initial:
            resolveView(for: .main)
        }
    }
    
    @ViewBuilder
    func resolveView(for route: Route) -> some View {
        switch route {
        case .splash:
            SplashView()
        case .main:
            MainViewConfigurator().setup(coordinator: self)
        case .register:
            RegisterViewConfigurator().setup(coordinator: self)
        case .login:
            LoginViewConfigurator().setup(coordinator: self)
        case .signup:
            RegisterViewConfigurator().setup(coordinator: self)
        case .forgotPassword:
            RecoverPasswordViewConfigurator().setup(coordinator: self)
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func resolveSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .forgotPassword:
            RecoverPasswordViewConfigurator().setup(coordinator: self)
        case .register:
            RegisterViewConfigurator().setup(coordinator: self)
        default: EmptyView()
        }
    }
    
    @ViewBuilder
    func resolveCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .signup: RegisterViewConfigurator().setup(coordinator: self)
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
        self.sheet = nil
        self.isPresentingSheet = false
        self.sheetPath.removeLast(sheetPath.count)
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
        self.isPresentingCover = false
        self.coverPath.removeLast(coverPath.count)
    }
    
    func presentAlert<T>(_ alert: T) where T: AlertDisplayableProtocol {
        alertPath.setAlert(alert)
    }
}
