//
//  TEMPItemView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 09/11/23.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    @State var itemAddedtoList = false
    
    var body: some View {
        NavigationStack {
            item.category.icon
            Text(item.name)
            Text(item.details)
            
            Button {
                itemAddedtoList = true
            } label: {
                Text("Quero")
            }
            
        }
        .navigationDestination(isPresented: $itemAddedtoList) {
            ItemConfirmationView()
        }
    }
}

struct ItemConfirmationView: View {
    var body: some View {
        Text("Pedido confirmado")
        Text("Agora o dono aprovará seu pedido.")
    }
}


