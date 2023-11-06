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
    @State private var path = [Item]()
    
    var body: some View {
        NavigationStack (path: $path){
            List {
                ForEach(items) { item in
                    NavigationLink(value: item) {
                        VStack {
                            item.category.icon
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(item.name)
                            Text(item.details)
                            Text(item.category.name)
                        }
                        .foregroundColor(item.category.color)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Itens")
            .navigationDestination(for: Item.self, destination: UploadItemView.init)
            .toolbar {
                Button("add", action: addItem)
                
            }
        }
    }
    

    
    func addItem() {
        let item = Item()
        context.insert(item)
        path = [item]
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let item = items[index]
            context.delete(item)
        }
    }
}

#Preview {
    TempFeedView()
}
