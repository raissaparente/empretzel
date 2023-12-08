//
//  ProfileView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI
import SwiftData


struct ProfileView: View {
    
    @Environment(\.modelContext) var context
    @Query var users: [User]
    var optionUsers = [   User(name: "Raissa", password: "123456", email: "raissa@email.com", cpf:                                           05223624351, phone: 85996120345),
                          
                          User(name: "Mariana", password: "123456", email: "mariana@email.com", cpf: 87666534212, phone: 85998874533),
                          
                          User(name: "Marcelle", password: "123456", email: "marcelle@email.com", cpf: 98999095421, phone: 85997009821),
                          
                          User(name: "Saulo", password: "123456", email: "saulo@email.com", cpf: 09812145470, phone: 85988987654)
    ]
    
    @Query(filter: #Predicate<User> { user in
        user.isLoggedin == true
    }) var loggedUser: [User]
    
    
    
    @StateObject var user: User
    
    
    var body: some View {
        VStack{
            Image("profilepic")
                .resizable()
                .frame(width: 90, height: 90)
            Text("Editar foto")
            
            Form {
                Section {
                    TextField("Digite seu nome", text: $user.name)
                } header: {
                    Text("Nome")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundStyle(.darkgray)
                        .textCase(nil)
                }
                
                Section {
                    TextField("Digite seu CPF", value: $user.cpf, format: .number)
               
                } header: {
                    Text("CPF")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundStyle(.darkgray)
                        .textCase(nil)
                }
                
                Section {
                    TextField("Digite seu celular", value: $user.phone, format: .number)

                } header: {
                    Text("Celular")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundStyle(.darkgray)
                        .textCase(nil)
                }
                
                Section {
                    TextField("Digite seu email", text: $user.email)
                } header: {
                    Text("Email")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundStyle(.darkgray)
                        .textCase(nil)
                }
                
                Section {
                    TextField("Digite sua senha", text: $user.password)
                } header: {
                    Text("Senha")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundStyle(.darkgray)
                        .textCase(nil)
                }
               
            }
           
        }
        .background(Color(uiColor: .systemGroupedBackground))
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
