//
//  BorrowedItemsView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 30/11/23.
//

import SwiftUI
import SwiftData


struct BorrowedItemsView: View {
    var item: Item
    
    @Query(filter: #Predicate<User> { user in
        user.isLoggedin == true
    }) var loggedUser: [User]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack {
                    StandardItemView(item: item)
                    
                    Spacer()
                    
                    if loggedUser.first == item.borrower {
                        HStack {
                            Text("Pedido aceito".uppercased())
                                .foregroundStyle(.acceptedgreen)
                                .font(.system(size: 18, weight: .semibold))
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(.acceptedgreen, lineWidth: 0.8)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(.acceptedgreen.opacity(0.5)))
                                }
                            HStack {
                                Image("phone.circle.fill")
                                    .foregroundStyle(.green)
                                Text("\(item.lender!.phone)")

                            }
                        }
                    } else {
                        HStack {
                            Text("Aguardando confirmação".uppercased())
                                .foregroundStyle(.waitingpurple)
                                .font(.system(size: 18, weight: .semibold))
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(.waitingpurple, lineWidth: 0.8)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(.waitingpurple.opacity(0.5)))
                                }
                        }
                    }
                    

                    
                    Spacer()
                    
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
