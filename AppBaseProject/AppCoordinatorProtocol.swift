//
//  AppCoordinatorProtocol.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 21/11/2024.
//

import SwiftUI
import Foundation

protocol AppCoordinatorProtocol: AnyObject {
    func push(next route: Route)
    func presentSheet(sheet: Route)
    func presentFullScreenCover(cover: Route)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissCover()
    func presentAlert<T>(_ alert: T) where T: AlertDisplayableProtocol
}

enum PresentationStyle {
    case fullScreenCover
    case sheet
}
