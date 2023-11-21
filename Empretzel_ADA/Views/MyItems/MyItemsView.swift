//
//  MyItemsView.swift
//  Empretzel_ADA
//
//  Created by Raissa Parente on 13/11/23.
//

import SwiftUI
import SwiftData

struct MyItemsView: View {
    @Query var borrowedItems: [Item] = CurrentUserManager.currentUser.borrowedItems
    
    var body: some View {
        VStack {
            Text(CurrentUserManager.currentUser.name)
                .font(.largeTitle)
            
            List {
                ForEach(borrowedItems) {item in
                    VStack {
                        Image(item.category.picture)
                        Text(item.name)
                    }
                }
            }
        }
        

    }
}
