//
//  Item Model.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//


import Foundation
import SwiftData
import SwiftUI

@Model
class Item {
    var name: String
    
    var category: Category
    
    var details: String
    var state: Int
//    var lender: User
//    var borrower: User?
    
    init(name: String = "", category: Category = Category.other, details: String = "", state: Int = 2) {
        self.name = name
        self.category = category
        self.details = details
        self.state = state
    
    }
}

