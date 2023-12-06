//
//  ProfileView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI


struct ProfileView: View {
    
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
    }
}
