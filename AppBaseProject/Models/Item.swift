//
//  Item.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 25/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var title: String
    var taskDescription: String
    
    init(timestamp: Date, title: String, taskDescription: String) {
        self.timestamp = timestamp
        self.title = title
        self.taskDescription = taskDescription
    }
}
