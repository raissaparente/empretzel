//
//  MyItemsView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI
import SwiftData

struct MyItemsView: View {
    @Environment(\.modelContext) var context
    @Query var items: [Item]
    @State var borrowedItems: [Item] = []
    @State var lentItems: [Item] = []
    
    @Query(filter: #Predicate<User> { user in
        user.isLoggedin == true
    }) var loggedUser: [User]

    var body: some View {
        
        NavigationStack {
            VStack (spacing: 35) {
  
                Spacer()
                

                MyItemsSectionView(title: "Pedi emprestado", itemArray: borrowedItems, trueConditionColor: .acceptedgreen, falseConditionColor: .waitingpurple, emptyArrayText: "Você ainda não fez nenhum pedido.", modalViewBorrow: true)
                

                MyItemsSectionView(title: "Estou emprestando", itemArray: lentItems, trueConditionColor: .accent, falseConditionColor: .clear, emptyArrayText: "Você ainda não anunciou nada.", modalViewBorrow: false)
                
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Meus Itens")
            .background(Color(uiColor: .systemGroupedBackground))
            .onAppear {
                let userId = loggedUser.first?.id
                let user = loggedUser.first

                
//                let borrowFetchDescriptor = FetchDescriptor<Item>(
//                        predicate: #Predicate {
//                            $0.borrowRequests.contains(userId!)
//                    })
                
                let lendFetchDescriptor = FetchDescriptor<Item>(
                        predicate: #Predicate {
                            $0.lender?.id == userId
                    })
                
//                borrowedItems = try! context.fetch(borrowFetchDescriptor)
                borrowedItems = items.filter { $0.borrowRequests.contains(user!) }
                lentItems = try! context.fetch(lendFetchDescriptor)
            }
        }
    }
}
