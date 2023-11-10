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
                            Button(category.name) {
                                item.category = category
                            }
                        }

            
            NavigationLink(destination: NameUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                Text("Continuar")
            }
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
            TextField("Descrição", text: $item.details)
            
            NavigationLink(destination: PictureUploadView(item: item, displayUploadItemView: $displayUploadItemView)) {
                Text("Continuar")
            }
        }
    }
    

}

struct PictureUploadView: View {
    @Environment(\.modelContext) var context
    var item: Item
    @Binding var displayUploadItemView: Bool
    @State var isLinkActive = false
    
    var body: some View {
        NavigationStack {
            Text("Escolha uma foto do seu item")
            Rectangle()
                .size(width: 100, height: 100)
            
            Button {
                addItem(item: item)
                isLinkActive = true
            } label: {
                Text("Adicionar item")
            }
        }
        .navigationDestination(isPresented: $isLinkActive) {
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
