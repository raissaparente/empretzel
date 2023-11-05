//
//  Item Model.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//


import Foundation
import SwiftData

@Model
class Item {
    var name: String
//    var category: Category
    var details: String
    var state: Int
//    var lender: User
//    var borrower: User?
    
    init(name: String = "", details: String = "", state: Int = 2) {
        self.name = name
        self.details = details
        self.state = state
    }
}

enum Category {
    case clothes
    case books
    case tools
    case tech
    case entertainment
    case other
}
