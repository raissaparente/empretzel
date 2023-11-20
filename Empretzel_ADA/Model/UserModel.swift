//
//  UserModel.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftData

@Model
class User {
    var name: String
    var password: String
    var email: String
    var cpf: Int
    var phone: Int
    var borrowedItems : [Item]
    var lentItems: [Item]
    
    
    init(name: String, password: String, email: String, cpf: Int, phone: Int, borrowedItems: [Item] = [], lentItems: [Item] = []) {
        self.name = name
        self.password = password
        self.email = email
        self.cpf = cpf
        self.phone = phone
        self.borrowedItems = borrowedItems
        self.lentItems = lentItems
    }
}

func isCPFValid(_ cpf: String) -> Bool {
    // Verifica se o CPF possui 11 dígitos
    guard cpf.count == 11 else {
        return false
    }
    
    // Cria um array com os dígitos do CPF
    let digits = cpf.map { Int(String($0)) }
    
    // Calcula o primeiro dígito verificador
    let sum1 = (0..<9).reduce(0) { sum, index in
        sum + digits[index]! * (10 - index)
    }
    let remainder1 = (sum1 * 10) % 11
    let verifier1 = (remainder1 == 10) ? 0 : remainder1
    
    // Calcula o segundo dígito verificador
    let sum2 = (0..<9).reduce(0) { sum, index in
        sum + digits[index]! * (11 - index)
    }
    let remainder2 = (sum2 * 10) % 11
    let verifier2 = (remainder2 == 10) ? 0 : remainder2
    
    // Verifica se os dígitos verificadores são iguais aos dígitos do CPF
    return verifier1 == digits[9] && verifier2 == digits[10]
}
