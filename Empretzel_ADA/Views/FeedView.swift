//
//  FeedView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI
import SwiftData

struct FeedView: View {
    @Query var items: [Item]
    @Environment(\.modelContext) var context
    @State var displayRequestView: Bool = false
    @State var selectedItem: Item? = nil
    
    init(filterText: String) {
        let predicate = #Predicate<Item> { item in
            item.name.localizedStandardContains(filterText)
            || item.details.localizedStandardContains(filterText)
            || filterText.isEmpty
        }
        _items = Query(filter: predicate)
    }
    
    var body: some View {
        VStack {
            ForEach(items) { item in
                Button {
                    displayRequestView = true
                    selectedItem = item
                } label: {
                    CardView(categoryName: item.category.name,categoryColor: item.category.color, itemName: item.name, itemDetails: item.details, itemImage: item.category.icon)
                }
            }
            .onDelete(perform: deleteItem) //n ta funcionando agr por causa do botao
            .sheet(isPresented: $displayRequestView) {
                if let selectedItem = selectedItem {
                    ItemView(item: selectedItem, displayRequestView: $displayRequestView)
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
