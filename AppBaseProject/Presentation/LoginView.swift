//
//  LoginView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import SwiftUI


class LoginViewConfigurator {
    @ViewBuilder
    func setup(coordinator: AppCoordinatorProtocol) -> some View {
        let viewModel = LoginViewModel(coordinator: coordinator)
        LoginView(viewModel: viewModel)
    }
}

class LoginViewModel: ObservableObject {
    var coordinator: AppCoordinatorProtocol
    @Published var username: String = ""
    @Published var password: String = ""

    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func login() {
        // validate login
        self.navigateTo(.home)
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func navigateToRoot() {
        coordinator.popToRoot()
    }
    
    func presentSheet(_ sheet: Route) {
        coordinator.presentSheet(sheet: sheet)
    }
    
    func setAuthenticatedRoot() {
        
    }
}

struct LoginView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Benfica App")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundColor(Color.black)
            
            Spacer()
            Image("benficaLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
    
            Spacer()
            
            VStack {
                TextField("User", text: $viewModel.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                
                Divider()
                
                SecureField("Password", text: $viewModel.password)
                    .padding(.top, 20)
                
                Divider()
            }
            .padding([.leading, .trailing], 32)
        
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    self.viewModel.navigateToRoot()
                    self.appRootManager.currentRoot = .tab
                }
            } label: {
                Text("Login")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            
            HStack {
                Text("Forgot your password?")
                Button {
                    withAnimation(.spring()) {
                        viewModel.presentSheet(.forgotPassword)
                    }
                } label: {
                    Text("Recover now")
                        .foregroundColor(Color.red)
                        .underline()
                }
            }
            
            
            HStack {
                Text("Don't have an account?")
                Button {
                    withAnimation(.spring()) {
                        viewModel.presentSheet(.register)
                    }
                } label: {
                    Text("Register now")
                        .foregroundColor(Color.red)
                        .underline()
                }
            }
        }
        .padding(16)
        .padding(.bottom, 16)
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.large)
    }
}
