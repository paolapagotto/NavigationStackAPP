//
//  HomeViewModel.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    //@Published var coordinator: HomeCoordinator
    @Published var animate: Bool = false
    @Published var data: [ImageName] = [.news1, .news2, .news3, .news4, .news5, .news6]
    
//    init(coordinator: HomeCoordinator) {
//        self.coordinator = coordinator
//    }

}
