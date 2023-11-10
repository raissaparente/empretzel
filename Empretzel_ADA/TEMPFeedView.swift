//
//  TEMPFeedView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import SwiftUI
import SwiftData

struct TempFeedView: View {
    @Query var items: [Item]
    @Environment(\.modelContext) var context
    @State var displayUploadItemView: Bool = false
    @State var displayRequestView: Bool = false
    @State var selectedItem: Item? = nil
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack {
                    ForEach(items) { item in
                            Button {
                                displayRequestView = true
                                selectedItem = item
                            }label: {
                                //card do item, eventualmente vai ser uma view separada
                                item.category.icon
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text(item.name)
                                Text(item.details)
                                Text(item.category.name)
                            }
                            .foregroundColor(item.category.color)
                    }
                    .onDelete(perform: deleteItem) //n ta funcionando agr por causa do botao
                }
                .navigationTitle("Itens")
                //botao de add item, vai ficar na tabbar depois
                .toolbar {
                    Button {
                        displayUploadItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                //modal de publicar item
                .sheet(isPresented: $displayUploadItemView) {
                    CategoryUploadView(displayUploadItemView: $displayUploadItemView)
                }
                //modal de visualizar e pedir item
                .sheet(isPresented: $displayRequestView) {
                    if let selectedItem = selectedItem {
                        ItemView(item: selectedItem)
                    }
                }
            }
        }
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let item = items[index]
            context.delete(item)
        }
    }
}
