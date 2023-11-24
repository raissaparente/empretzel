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
    @State var items: [Item] = []
    
    var body: some View {
        
        NavigationStack {
            VStack {
  
                VStack {
                    Text("Pedi emprestado")
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(items) {item in
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
                
//                VStack {
//                    Text("Estou emprestando")
//                    ScrollView (.horizontal, showsIndicators: false){
//                        HStack {
//                            ForEach(lentItems) {item in
//                                MyItemCardView(item: item)
//                            }
//                        }
//                    }
//                }
//                .padding()
//                .frame(width: 400, height: 250)
//                .background {
//                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                        .fill(Color(uiColor: .secondarySystemGroupedBackground))
//                }
                
                Spacer()
                
                
            }
            .padding()
            .navigationTitle("Meus Itens")
            .background(Color(uiColor: .systemGroupedBackground))
            .onAppear {
                let id = CurrentUserManager.currentUser.id
                let fetchDescriptor = FetchDescriptor<Item>(
                        predicate: #Predicate {
                            $0.borrower == id
                    })
                items = try! context.fetch(fetchDescriptor)
            }
        }
    }
}
