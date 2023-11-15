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
                        Image(item.category.icon)
                        Text(item.name)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.accent)
                        
                        MakeCapsuleTag(text: "Dono: Mariana", textColor: item.category.color, borderColor: item.category.color)
                        
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
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    
                    Button {
                        isNavigationActive = true
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
}

struct ItemConfirmationView: View {
    let item: Item
    @Binding var displayRequestView: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.lightgray
                .ignoresSafeArea()
            VStack {
                VStack (spacing: 40){
                    Image(item.category.icon)
                    Text(item.name)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.accent)
                    
                    
                    Text("Solicitação enviada!")
                        .font(.largeTitle)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                displayRequestView = false
                            }
                        }
                    
                    Image("logopurple")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 500)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
            .navigationTitle("Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct MakeRequestInstruction: View {
    var number: String
    var text: String
    
    var body: some View {
        HStack {
            Text(number)
                .bold()
                .padding(5)
                .foregroundStyle(.white)
                .background(Circle().fill(.accent))
            Text(text)
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
                .font(.system(size: 13))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background {
            Capsule(style: .circular)
                .strokeBorder(borderColor, lineWidth: 0.8)
                .background(Capsule().fill(borderColor.opacity(0.2)))
        }
    }
}
