//
//  RecoverPasswordView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 12/11/2024.
//

import SwiftUI

class RecoverPasswordViewConfigurator {
    @ViewBuilder
    func setup(coordinator: AppCoordinatorProtocol) -> some View {
        let viewModel = RecoverPasswordViewModel(coordinator: coordinator)
        RecoverPasswordView(viewModel: viewModel)
    }
}

class RecoverPasswordViewModel: ObservableObject {
    var coordinator: AppCoordinatorProtocol
    @Published var email: String = ""
    @Published var errorMessage: String = "E-mail is not registered. Please try another e-mail."
    @Published var showErrorMessage: Bool = false

    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func validateEmail() -> Bool {
        self.showErrorMessage = !self.email.contains("@") && !self.email.contains(".")
        return self.email.contains("@") && self.email.contains(".")
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func navigateToRoot() {
        coordinator.popToRoot()
    }
    
    func dismissSheet() {
        self.coordinator.dismissSheet()
    }
    
    func handleTappedButton() {
        if validateEmail() {
            self.dismissSheet()
        } else {
            showErrorMessage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.easeInOut) {
                    self.showErrorMessage = false
                }
            }
        }
    }
}

struct RecoverPasswordView: View {
    @StateObject var viewModel: RecoverPasswordViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.red)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                if !viewModel.email.isEmpty {
                        Text("E-mail")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                
                TextField("E-mail", text: $viewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                
                Divider()
                    .padding(.bottom, 16)
            }
            .padding(32)
            
            VStack {
                Button(action: {
                    viewModel.handleTappedButton()
                }) {
                    Text("Recover password")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundColor(Color.white)
                        
                        .background(viewModel.showErrorMessage ? Color.gray : Color.black)
                        .cornerRadius(8)
                }
                .padding(16)
                .frame(height: 48)
                //.disabled(viewModel.email.isEmpty || viewModel.showErrorMessage)
                
                Text(viewModel.errorMessage)
                    .foregroundColor(viewModel.showErrorMessage ? .red : .clear)
                    .font(.caption)
                    .bold()
            }
            
            Spacer()
            
            Button(action: {
                viewModel.dismissSheet()
            }) {
                Text("Go Back")
                    .foregroundColor(.red)
            }
            .padding(.bottom, 32)
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
}
