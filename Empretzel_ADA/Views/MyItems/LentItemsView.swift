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
                StandardItemView(item: item)
                
                Spacer()
                
                HStack {
                    Text("Lista de pessoas")
                }
                .padding()
            }
        }
    }
}
