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
            VStack {
                VStack {
                    item.category.icon
                    Text(item.name.uppercased())
                        .font(.title3)
                        .foregroundStyle(.accent)
                    
                    MakeCapsuleTag(text: "Dono: Mariana", textColor: .accent, borderColor: item.category.color)
                    
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
                        MakeCapsuleTag(text: "Bom estado".uppercased(), textColor: item.category.color, borderColor: item.category.color)
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
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray)
                        .shadow(color: item.category.color, radius: 10)
                )
                
                Button {
                    isNavigationActive = true
                } label: {
                    Text("Quero")
                }
                .frame(width: 290, height: 70)
                .background(item.category.color)
                .foregroundStyle(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
            }
            .padding()
            .navigationTitle("Item")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $isNavigationActive) {
                ItemConfirmationView(displayRequestView: $displayRequestView)
            }
        }
    }
}

struct ItemConfirmationView: View {
    @Binding var displayRequestView: Bool
    
    var body: some View {
        Text("Pedido confirmado")
        Text("Agora o dono aprovará seu pedido.")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    displayRequestView = false
                }
            }
    }
}


struct MakeRequestInstruction: View {
    var number: String
    var text: String
    
    var body: some View {
        HStack {
            Text(number)
                .font(.footnote)
                .bold()
                .padding(5)
                .foregroundStyle(.white)
                .background(Circle().fill(.accent))
            Text(text)
                .font(.footnote)
                .italic()
        }
    }
}

struct MakeCapsuleTag: View {
    var text: String
    var textColor: Color
    var borderColor: Color
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundStyle(textColor)
                .font(.system(size: 15))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background {
            Capsule(style: .circular)
                .strokeBorder(borderColor, lineWidth: 0.8)
                .background(Capsule().fill(.lightgray))
        }
    }
}
