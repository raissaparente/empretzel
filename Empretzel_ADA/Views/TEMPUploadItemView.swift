//
//  TEMPUploadItemView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

//Upload view path:
//CategoryUploadView >> NameUploadView >> PictureUploadView >> ConfirmationUploadView

import SwiftData
import SwiftUI

struct CategoryUploadView: View {
    @Bindable var item = Item()
    @Binding var displayUploadItemView: Bool
    
    var body: some View {
        NavigationStack {
            Text("Escolha a categoria do seu item")
            
            ForEach(Category.allCases, id: \.self) { category in
                //botao fora do padrao, corrigir
                Button(category.name) {
                    item.category = category
                }
            }
            
            NavigationLink(destination: NameUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                Text("Continuar")
            }
            .navigationTitle("Categoria")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct NameUploadView: View {
    @Bindable var item: Item
    @Binding var displayUploadItemView: Bool
    
    var body: some View {
        NavigationStack{
            Text("Descreva o seu item")
            
            TextField("Nome", text: $item.name)
                .textFieldStyle(.roundedBorder)
            TextField("Descrição", text: $item.details, axis: .vertical)
                .lineLimit(5...10)
                .textFieldStyle(.roundedBorder)
            
            NavigationLink(destination: PictureUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                Text("Continuar")
            }
            .navigationTitle("Descrição")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
}

struct PictureUploadView: View {
    @Environment(\.modelContext) var context
    var item: Item
    @Binding var displayUploadItemView: Bool
    @State var isNavigationActive = false
    
    var body: some View {
        NavigationStack {
            Text("Escolha uma foto do seu item")
            
            //placeholder pra imageui
            Rectangle()
                .size(width: 100, height: 100)
            
            Button {
                addItem(item: item)
                isNavigationActive = true
            } label: {
                Text("Adicionar item")
            }
            .navigationTitle("Imagem")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationDestination(isPresented: $isNavigationActive) {
            ConfirmationUploadView(displayUploadItemView: $displayUploadItemView)
        }
    }
    
    func addItem(item: Item) {
        context.insert(item)
    }
}

struct ConfirmationUploadView: View {
    @Binding var displayUploadItemView: Bool
    
    var body: some View {
        Text("Item Adicionado!")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    displayUploadItemView = false
                }
            }
    }
}

