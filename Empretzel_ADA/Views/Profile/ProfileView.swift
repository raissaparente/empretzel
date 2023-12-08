//
//  ProfileView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI
import SwiftData


struct ProfileView: View {
      
    @Query(filter: #Predicate<User> { user in
        user.isLoggedin == true
    }) var loggedUser: [User]
    
    @State var editOn: Bool = false
    
    
   @State var user = User(name: "Raissa", password: "123456", email: "raissa@email.com", cpf:                                           "05223624351", phone: "85996120345")
    
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image("profilepic")
                        .resizable()
                        .frame(width: 90, height: 90)
                    Text("Editar foto")
                    
                    Form {
                        Section {
                            if editOn {
                                TextField("Digite seu nome", text: $user.name)
                            } else {
                                Text(loggedUser.first?.name ?? "usuário")
                            }
                        } header: {
                            Text("Nome")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        
                        Section {
                                Text(loggedUser.first!.cpf)
                        } header: {
                            Text("CPF")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        
                        Section {
                            if editOn{
                                TextField("Digite seu celular", text: $user.phone)
                            } else {
                                Text(loggedUser.first!.phone)
                            }
                        } header: {
                            Text("Celular")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        
                        Section {
                            if editOn {
                                TextField("Digite seu email", text: $user.email)
                            } else {
                                Text(loggedUser.first!.email)
                            }
                        } header: {
                            Text("Email")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                        
                        Section {
                            if editOn {
                                TextField("Digite sua senha", text: $user.password)
                            } else {
                                Text(loggedUser.first!.password)
                            }
                        } header: {
                            Text("Senha")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundStyle(.darkgray)
                                .textCase(nil)
                        }
                       
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        MakeButtonLink(text: "Sair")
                    }
                   
                }
                .background(Color(uiColor: .systemGroupedBackground))
            }
            .navigationTitle("Meu Perfil")
            .toolbar {
                Button {
                    editOn = true
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
 
    }
}
