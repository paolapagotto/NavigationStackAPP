//
//  Product.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import Foundation
import SwiftData


struct Product: Identifiable, Hashable, Equatable {
    let id = UUID()
    let title: String
    let description: String
}
