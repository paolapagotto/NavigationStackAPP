//
//  SearchViewModel.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI

class SearchViewModel: ObservableObject {
//    var coordinator: SearchCoordinator
    @Published var categories: [Category] = []
    @Published var categorySelected: Category? = nil
    @Published var searchText: String = ""
    @Published var isPresented: Bool = true
    
    init(categories: [Category]) {
        self.categories = categories
    }
}
