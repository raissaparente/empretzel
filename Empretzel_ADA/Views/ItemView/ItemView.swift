//
//  TEMPItemView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 09/11/23.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    @Binding var displayRequestView: Bool
    @State var isNavigationActive = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color.lightgray
                    .ignoresSafeArea()

                VStack {
                    
                    VStack (spacing: 20) {
                        Image(item.category.picture)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text(item.name)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.accent)
                        
                        MakeCapsuleTag(text: "Dono: \(item.lender.name)", textColor: item.category.color, borderColor: item.category.color)
                        
                        //Descricao
                        VStack {
                            Text(item.details)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                        .background(.lightgray)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        //Tags
                        HStack {
                            MakeCapsuleTag(text: item.category.name.uppercased(), textColor: item.category.color, borderColor: item.category.color)
                            MakeCapsuleTag(text: stateString(state: item.state).uppercased(), textColor: item.category.color, borderColor: item.category.color)
                        }
                        
                        //Instrucoes de emprestimo
                        VStack (alignment: .leading, spacing: 0) {
                            MakeRequestInstruction(number: "1", text: "Solicite o empréstimo")
                            MakeRequestInstruction(number: "2", text: "Aguarde a confirmação da solicitação")
                            MakeRequestInstruction(number: "3", text: "Entre em contato com o dono do item")
                        }
                        .padding(.vertical, 20)
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    
                    Button {
                        isNavigationActive = true
                        CurrentUserManager.currentUser.borrowedItems.append(item)
                    } label: {
                        Text("Quero")
                            .font(.title2)
                            .frame(maxWidth: .infinity, minHeight: 60)
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()
                }
                .padding()
                .navigationTitle("Item")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $isNavigationActive) {
                    ItemConfirmationView(item: item, displayRequestView: $displayRequestView)
                }
            }
        }
    }
    
    func stateString(state: Int) -> String{
        if state == 1 {
            return "Danificado"
        } else if state == 3 {
            return "Excelente"
        } else {
            return "Bom estado"
        }
    }
}






