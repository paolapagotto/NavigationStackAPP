//
//  AppRoute.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import Foundation

enum AppRoot: Hashable {
    case initial
    case tab
    case login
}

enum Route: Hashable {
    case splash
    case main
    case tabView
    case signup
    case home
    case search
    case shop
    case profile
    
    case register
    case detail(Category)
    case detailTask(String)
    case addCategory
    case payment
    
    case login
    case paywall
    case forgotPassword
    case homeChild
    case homeSecondChild
    
    case empty
}

enum Sheet: String, Identifiable, Codable, Hashable  {
    var id: String {
        self.rawValue
    }
    case register
    case payment
    case forgotPassword
    case empty
}

enum FullScreenCover: String, Identifiable, Codable, Hashable {
    var id: String {
        self.rawValue
    }
    case login
    case signup
    case empty
}
