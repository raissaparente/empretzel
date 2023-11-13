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
            item.category.icon
            Text(item.name)
            Text(item.details)
            
            Button {
                isNavigationActive = true
            } label: {
                Text("Quero")
            }
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


