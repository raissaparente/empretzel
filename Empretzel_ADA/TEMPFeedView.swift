//
//  TEMPFeedView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 05/11/23.
//

import Foundation

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
                            Text(item.name)
                            Text(item.details)
                        }
                    }
                }
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
}

#Preview {
    TempFeedView()
}
