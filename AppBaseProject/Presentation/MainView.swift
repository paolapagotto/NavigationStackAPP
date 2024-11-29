//
//  MainView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI


class MainViewConfigurator {
    @ViewBuilder
    func setup(coordinator: AppCoordinatorProtocol) -> some View {
        let viewModel = MainViewModel(coordinator: coordinator)
        MainView(viewModel: viewModel)
    }
}

class MainViewModel: ObservableObject {
    @Published var coordinator: AppCoordinatorProtocol
    @Published var appState: AppSessionState = .withoutSession
    @Published var showSplash: Bool = false
    
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func presentSheet(_ sheet: Route) {
        coordinator.presentSheet(sheet: sheet)
    }
    
}

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {

            Image("benficaStadium")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.8)
            
            Image("benficaLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                .blendMode(.destinationOut)
            
            VStack {
                Spacer()
                Text("Welcome")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                
                Button {
                    viewModel.navigateTo(.login)
                } label: {
                    Text("Sign In")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                
                HStack {
                    Text("Don't have an account?")
                    Button {
                        viewModel.presentSheet(.register)
                    } label: {
                        Text("Sign up now")
                            .foregroundColor(Color.black)
                            .bold()
                            .underline()
                    }
                }
            }
            .padding(16)
            .padding(.bottom, 16)
        }
        .compositingGroup()
        //.shadow(color: .black.opacity(0.7), radius: 15, x: -10, y: 10)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.viewModel.showSplash = true
                }
            }
        }
    }
    
    @ViewBuilder
    func loadingView() -> some View {
        ProgressView(label: {
            Text("Loading...")
        })
    }
}
