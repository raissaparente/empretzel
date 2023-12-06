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
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                VStack {
                    StandardItemView(item: item, showOwner: false)
                    
                    Spacer()
                    
                    Text("Pessoas que querem esse item:")
                    
                    HStack {
                        Button("Marcelle"){ }
                            .buttonStyle(.borderedProminent)
                        Button("Mariana"){ }
                            .buttonStyle(.bordered)
                            .tint(.accent)
                        Button("Raissa"){ }
                            .buttonStyle(.bordered)
                            .tint(.accent)
                    }
                    
                    Spacer()
                    
                    Button {
                        //action
                    } label : {
                        Text("Confirmar empréstimo")
                            .font(.title2)
                            .frame(width: 280, height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    
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
