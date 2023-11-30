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
    @State var borrowedItems: [Item] = []
    @State var lentItems: [Item] = []
    
    var body: some View {
        
        NavigationStack {
            VStack (spacing: 35) {
  
                MyItemsSectionView(title: "Pedi Emprestado", itemArray: borrowedItems, trueConditionColor: .acceptedgreen, falseConditionColor: .waitingpurple)
                
                MyItemsSectionView(title: "Estou emprestando", itemArray: lentItems, trueConditionColor: .accent, falseConditionColor: .clear)
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Meus Itens")
            .background(Color(uiColor: .systemGroupedBackground))
            .onAppear {
                let id = CurrentUserManager.currentUser.id
                
                let borrowFetchDescriptor = FetchDescriptor<Item>(
                        predicate: #Predicate {
                            $0.borrower == id
                    })
                let lendFetchDescriptor = FetchDescriptor<Item>(
                        predicate: #Predicate {
                            $0.lender == id
                    })
                
                borrowedItems = try! context.fetch(borrowFetchDescriptor)
                lentItems = try! context.fetch(lendFetchDescriptor)
            }
        }
    }
}
