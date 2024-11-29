//
//  Image+Extensions.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 12/11/2024.
//

import Foundation
import SwiftUI

enum ImageName: String {
    
    case person = "person.fill"
    case eye = "eye"
    case eyeSlash = "eye.slash"
    case checkMarkFilled = "checkmark.circle.fill"
    case checkmark = "checkmark.circle"
    case home = "house.circle.fill"
    case search = "magnifyingglass.circle.fill"
    case shop = "cart.circle.fill"
    case profile = "person.circle.fill"
    case benfica1 = "benficaHist-1"
    case benfica2 = "benficaHist-2"
    case benfica3 = "benficaHist-3"
    case benfica4 = "benficaHist-4"
    case benfica5 = "benficaHist-5"
    case news1 = "news1"
    case news2 = "news2"
    case news3 = "news3"
    case news4 = "news4"
    case news5 = "news5"
    case news6 = "news6"
    
    case none = ""
}

extension Image {
    init(name: ImageName) {
        self.init(name.rawValue)
    }
    
    init(sysNameImage: ImageName) {
        self.init(systemName: sysNameImage.rawValue)
    }
}
