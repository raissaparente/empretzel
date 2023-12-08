//
//  LentItemsView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 01/12/23.
//

import Foundation

import SwiftUI

struct LentItemsView: View {
    var item: Item
    @State var userAccepted: User?
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                VStack {
                    StandardItemView(item: item, showOwner: false)
                    
                    Spacer()
                    
                    if item.borrowRequests.isEmpty {
                        Text("O seu item ainda não tem pedidos.")
                            .padding(.vertical, 25)

                    } else {
                        Text("Pessoas que querem esse item:")
                        
                        HStack {
                            ForEach (item.borrowRequests){ user in
                                Button(user.name){
                                    userAccepted = user
                                }
                                .buttonStyle(.bordered)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            item.borrower = userAccepted
                        } label : {
                            Text("Confirmar empréstimo")
                                .font(.title2)
                                .frame(width: 280, height: 40)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                     

                    

                    
                }
                .padding()
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
            .navigationTitle("Pedi emprestado")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}
