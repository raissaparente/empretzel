//
//  TestUser.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 17/11/23.
//

import Foundation

class UserRaissa: ObservableObject {
    @Published var raissa = User(name: "Raissa", password: "123456", email: "raissa@email.com", cpf: 05223624351, phone: 85996120345)
}
