//
//  Item Model.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftData
import Foundation

@Model
class Item {
    var name: String
    var category: Category
    var details: String
    var state: Int
    
    var lender: User?
//    var borrowRequests: [Int] = []
    var borrower: User?
    var isAccepted: Bool = false
    
    init(name: String = "", category: Category = Category.other, details: String = "", state: Int = 0) {
        self.name = name
        self.category = category
        self.details = details
        self.state = state
    }
}

