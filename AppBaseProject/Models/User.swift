//
//  User.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import Foundation

struct User: Encodable, Identifiable, Hashable, Equatable {
    let id = UUID()
    var name: String
    var email: String
    var city: String
    var password: String
}
