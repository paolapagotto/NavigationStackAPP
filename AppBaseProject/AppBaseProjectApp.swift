//
//  AppBaseProjectApp.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI
import SwiftData

enum AppSessionState {
    case sessionCreated
    case withoutSession
    case offline
}


@main
struct AppBaseProjectApp: App {
    @StateObject var baseCoordinator = BaseCoordinator()
    @StateObject var tabBarCoodinator = TabBarCoordinator()
    @StateObject private var appRootManager = AppRootManager()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            VStack {
                if appRootManager.currentRoot == .tab {
                    TabBarView(viewModel: TabBarViewModel(tabCoordinator: tabBarCoodinator))
                } else {
                    BaseView(viewModel: BaseViewModel(coordinator: baseCoordinator))
                }
            }
            .environmentObject(appRootManager)
        }
        .modelContainer(sharedModelContainer)
    }
}
