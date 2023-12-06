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
            VStack {
  
                VStack (alignment: .leading) {
                    Text("Pedi emprestado")
                        .bold()
                      
                    Spacer()
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(borrowedItems) {item in
                                MyItemCardView(item: item)
                            }
                        }
                    }
                }
                .padding()
                .frame(width: 400, height: 250)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(uiColor: .secondarySystemGroupedBackground))
                }
                
                VStack (alignment: .leading) {
                    Text("Estou emprestando")
                        .bold()
                    Spacer()
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(lentItems) {item in
                                MyItemCardView(item: item)
                            }
                        }
                    }
                }
                .padding()
                .frame(width: 400, height: 250)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(uiColor: .secondarySystemGroupedBackground))
                }
                
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
