//
//  Item Model.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftData

//test user
let raissa = User(name: "Raissa", password: "123456", email: "raissa@email.com", cpf: 05223624351, phone: 85996120345)

@Model
class Item {
    var name: String
    var category: Category
    var details: String
    var state: Int
    var lender: User
//    var borrower: User?
    
    init(name: String = "", category: Category = Category.other, details: String = "", state: Int = 0, lender: User = raissa) {
        self.name = name
        self.category = category
        self.details = details
        self.state = state
        self.lender = lender
    }
}

