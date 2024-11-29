//
//  HomeView.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @StateObject var coordinator: HomeCoordinator
    
    var body: some View {
        NavigationStack(path: /*$viewModel.*/$coordinator.path) {
            ZStack {
                Color.black
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Olá, User")
                        Spacer()
                        
                        Button {
                            /*viewModel.*/coordinator.push(next: .profile)
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .foregroundStyle(.tint)
                                .imageScale(.large)
                        }
                        
                    }
                    .padding([.leading, .trailing], 16)
                    .background(Color.white)
                    
                    Spacer()
                    
                    CarouselView(data: viewModel.data)
                        .padding(.bottom, 16)
                        .onTapGesture(perform: {
                            /*viewModel.*/coordinator.presentSheet(sheet: .homeChild)
                        })
                    
                    VStack {
                        PlaceHolderCustomView()
                    }
                    .background(Color.white)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                
                }
            }
            .background(Color.black)
            .navigationDestination(for: Route.self, destination: { route in
                /*viewModel.*/coordinator.resolveView(for: route)
            })
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $coordinator.isPresentingSheet) {
            NavigationStack(path: $coordinator.sheetPath) {
                coordinator.resolveView(for: coordinator.sheetModalRoot)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.resolveView(for: route)
                }
            }
        }
        .fullScreenCover(isPresented: $coordinator.isPresentingCover) {
            NavigationStack(path: $coordinator.coverPath) {
                coordinator.resolveView(for: coordinator.coverModalRoot)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.resolveView(for: route)
                }
            }
        }
        .alert(for: $coordinator.alertPath)
    }
}
