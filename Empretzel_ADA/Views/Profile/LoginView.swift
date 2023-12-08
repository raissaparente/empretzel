//
//  LoginView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 08/12/23.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) var context
    @Query var users: [User]
    var optionUsers = [   User(name: "Raissa", password: "123456", email: "raissa@email.com", cpf:                                           "05223624351", phone: "85996120345"),
                          
                          User(name: "Mariana", password: "123456", email: "mariana@email.com", cpf: "87666534212", phone: "85998874533"),
                          
                          User(name: "Marcelle", password: "123456", email: "marcelle@email.com", cpf: "98999095421", phone: "85997009821"),
                          
                          User(name: "Saulo", password: "123456", email: "saulo@email.com", cpf: "09812145470", phone: "85988987654")
    ]
    
    @Query(filter: #Predicate<User> { user in
        user.isLoggedin == true
    }) var loggedUser: [User]
                         
    
    var body: some View {
        VStack {
            VStack {
                Button("Adicionar") {
                    for user in optionUsers {
                        context.insert(user)
                    }
                }
                
                Text("Login:")
                ForEach(users) { user in
                    Button(user.name) {
                        
                        for user in users {
                            user.isLoggedin = false
                        }
                        
                        user.isLoggedin = true
                    }
                }
                
                
                Text(loggedUser.first?.name ?? "name")
                Text(loggedUser.first?.id ?? "id")
            }
        }
    }
}

#Preview {
    LoginView()
}
