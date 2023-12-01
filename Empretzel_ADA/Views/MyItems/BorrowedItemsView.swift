//
//  BorrowedItemsView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 30/11/23.
//

import SwiftUI

struct BorrowedItemsView: View {
    var item: Item
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack {
                    StandardItemView(item: item)
                    
                    Spacer()
                    
                    HStack {
                        Text("Aguardando confirmação".uppercased())
                            .foregroundStyle(.waitingpurple)
                            .font(.system(size: 20, weight: .semibold))
                        
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(.waitingpurple, lineWidth: 0.8)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(.waitingpurple.opacity(0.5)))
                            }
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
